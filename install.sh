#!/bin/bash
# install fonts in every subfolder
cp ./parcel/fonts/* $HOME/.local/share/fonts/
cp ./quotes/fonts/* $HOME/.local/share/fonts/
cp ./sidebar/fonts/* $HOME/.local/share/fonts/

# TODO: add start-up entry that will run start_conky.sh

# TODO: add a start-up entry to run quotes/download_quotes.sh