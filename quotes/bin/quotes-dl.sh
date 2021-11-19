#!/bin/bash

source $HOME/.conky/quotes/.env
wget -o $DOWNLOAD_LOG -O $QUOTES_FILE $QUOTE_URL
$HOME/.conky/quotes/bin/select_quote.py $QUOTES_FILE $SELECTED_QUOTES_FILE
