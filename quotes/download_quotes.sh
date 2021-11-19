#!/bin/sh
wget -o ~/.conky/quotes/quotes.log -O ~/.conky/quotes/quotes.json https://gist.githubusercontent.com/zkhan93/994a6dc9718c3a3f0c6d97dcdae0e81c/raw
/usr/bin/python3 ~/.conky/quotes/select_quote.py
