#!/bin/bash

# Function to display the full multiplication table
display_full_table() {
    local num=$1
    echo "Multiplication table for $num:"
    for i in {1..10}; do
        echo "$num * $i = $((num * i))"
    done
}

# Function to display the partial multiplication table
display_partial_table() {
    local num=$1
    local start=$2
    local end=$3
    
    if (( start < 1 || end > 10 || start > end )); then
        echo "Invalid range. Displaying full multiplication table instead."
        display_full_table "$num"
        return
    fi

    echo "Multiplication table for $num (from $start to $end):"
    for ((i = start; i <= end; i++)); do
        echo "$num * $i = $((num * i))"
    done
}

# Prompt user for input
read -p "Enter a number to generate the multiplication table: " number

# Validate the input
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Invalid number. Please enter a valid number."
    exit 1
fi

# Prompt user for table range preference
read -p "Do you want a full table (1-10) or a partial table? (full/partial): " choice

case "$choice" in
    full)
        display_full_table "$number"
        ;;
    partial)
        read -p "Enter the start of the range (1-10): " start
        read -p "Enter the end of the range (1-10): " end
        
        # Validate the start and end range
        if ! [[ "$start" =~ ^[0-9]+$ ]] || ! [[ "$end" =~ ^[0-9]+$ ]]; then
            echo "Invalid range values. Please enter valid numbers."
            exit 1
        fi
        
        display_partial_table "$number" "$start" "$end"
        ;;
    *)
        echo "Invalid choice. Please enter 'full' or 'partial'."
        exit 1
        ;;
esac
