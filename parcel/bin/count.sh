#!/bin/bash
source $HOME/.conky/parcel/.env
ITEMS=$(curl -s $PARCEL_LIST)
COUNT=$(echo "$ITEMS" | wc -l)
echo $COUNT
