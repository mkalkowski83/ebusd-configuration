#!/bin/bash

# Sprawdzenie czy podano dokładnie 1 argument (wartość hex)
if [ "$#" -ne 1 ]; then
  echo "Użycie: $0 HEX_VALUE"
  echo "Przykład: $0 03feb55503"
  exit 1
fi

HEX=$1

# Lista typów do podstawienia w pętli
TYPES=("BCD" "BCD:2" "BCD:3" "BCD:4" "BDA" "BDA:3" "BDY" "BDZ" "BTI" "BTM" "D1B" "D1C" "D2B" "D2C" "DAY" "DTM" "EXP" "EXR" "FLR" "FLT" "HCD" "HCD:1" "HCD:2" "HCD:3" "HDA" "HDA:3" "HDY" "HEX:1" "HEX:10" "HEX:11" "HEX:2" "HEX:3" "HEX:4" "HEX:5" "HEX:6" "HEX:9" "HTI" "HTM" "MIN" "NTS:1" "NTS:10" "NTS:11" "NTS:2" "NTS:3" "NTS:4" "NTS:5" "NTS:6" "NTS:9" "PIN" "S1L" "S2B" "S2L" "S3B" "S3L" "S3N" "S3R" "S4B" "S4L" "SCH" "SIN" "SIR" "SLG" "SLR" "STR:1" "STR:10" "STR:11" "STR:2" "STR:3" "STR:4" "STR:5" "STR:6" "STR:9" "TTM" "U1L" "U2B" "U2L" "U3B" "U3L" "U3N" "U3R" "U4B" "U4L" "UCH" "UIN" "UIR" "ULG" "ULR" "VTI" "VTM")

for TYPE in "${TYPES[@]}"; do
  echo "Dekodowanie dla typu: $TYPE"
  ebusctl -p 9999 decode "$TYPE" $(ebusctl -p 9999 hex "$HEX"  | tail -c 10)
  echo "-----------------------------"
done
