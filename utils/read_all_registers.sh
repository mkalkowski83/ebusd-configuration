#!/bin/bash
#
# Script to read all available ebusd registers
# Usage: ./read_all_registers.sh [port]
#
# If port is not provided, it defaults to 9999

# Set default port to 9999 if not specified
PORT=${1:-9999}

echo "Reading all registers from ebusd on port $PORT..."
echo "----------------------------------------"

# Create a temporary file to store the list of registers
TEMP_FILE=$(mktemp)

# Get the list of registers and save to temp file
ebusctl -p $PORT find > "$TEMP_FILE"

# Check if we got any registers
if [ ! -s "$TEMP_FILE" ]; then
    echo "Error: No registers found or ebusd not running on port $PORT"
    rm "$TEMP_FILE"
    exit 1
fi

# Count total registers
TOTAL_REGISTERS=$(wc -l < "$TEMP_FILE")
echo "Found $TOTAL_REGISTERS registers"
echo "----------------------------------------"

# Read each register
COUNTER=0
while read -r register; do
    COUNTER=$((COUNTER + 1))
    echo "[$COUNTER/$TOTAL_REGISTERS] Reading: $register"
    ebusctl -p $PORT read "$register"
    echo "----------------------------------------"
    # Optional: Add a small delay to prevent overwhelming ebusd
    sleep 0.1
done < "$TEMP_FILE"

# Clean up
rm "$TEMP_FILE"

echo "All registers read successfully"
