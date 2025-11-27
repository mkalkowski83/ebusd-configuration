#!/bin/bash
for i in {0..255}; do
    hex_i=$(printf "%02x" $i)
    echo "Testing index $hex_i"
    ebusctl -p 9999 read -h 08b516081003ffff04${hex_i}0032
done
