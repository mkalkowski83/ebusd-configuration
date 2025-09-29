#!/bin/bash

# Sprawdzenie czy podano dokładnie 1 argument (wartość hex)
if [ "$#" -ne 1 ]; then
  echo "Użycie: $0 HEX_VALUE"
  echo "Przykład: $0 03feb55503"
  exit 1
fi

HEX=$1

# Lista typów do podstawienia w pętli
TYPES=("BCD" "D1B" "D1C" "D2B" "D2C" "DAY" "DTM" "EXP" "EXR" "FLR" "FLT" "HCD" "HCD:1" "HCD:2" "HCD:3" "HDA" "HDA:3" "HDY" "HEX:10" "HEX:9" "HTM" "MIN" "NTS:10" "NTS:9" "PIN" "S1L" "S2B" "S2L" "S3B" "S3L" "S>

for TYPE in "${TYPES[@]}"; do
  echo "Dekodowanie dla typu: $TYPE"
  ebusctl -p 9999 decode "$TYPE" "$HEX"
  echo "-----------------------------"
done
