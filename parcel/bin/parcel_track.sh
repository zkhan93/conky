#!/bin/bash
source $HOME/.conky/parcel/.env
CARRIER=$1
TRACKING_NUMBER=$2
RESPONSE=$(curl -s -X POST -d "{\"tracking_number\": \"$TRACKING_NUMBER\", \"carrier_code\": \"$CARRIER\"}" -k "https://api.tracktry.com/v1/trackings/realtime" -H "Content-Type:application/json" -H "Tracktry-Api-Key:$TRACKTRY_API_KEY")
RESULT=$(echo $RESPONSE | jshon -e data -e items -e 0 -e lastEvent -u)
echo $RESULT
