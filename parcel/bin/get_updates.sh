#!/bin/bash
source $HOME/.conky/parcel/.env
ITEMS=$(curl -s $PARCEL_LIST)
NTH_ITEM=$(echo "$ITEMS" | sed -n "$1p")
#echo $NTH_ITEM

TITLE=$(echo $NTH_ITEM | cut -d ',' -f1)
TYPE=$(echo $NTH_ITEM | cut -d ',' -f2)
NUMBER=$(echo $NTH_ITEM | cut -d ',' -f3)

STATUS=$($HOME/.conky/parcel/bin/parcel_track.sh $TYPE $NUMBER)
echo $TITLE
echo $STATUS
