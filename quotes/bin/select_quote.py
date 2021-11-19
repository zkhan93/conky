#!/usr/bin/python3

import json
import random
import sys

selected_quote = {}

quotes_file = sys.argv[1]
selected_quote_file = sys.argv[2]

with open(quotes_file, 'r') as quotes_fh:
	quotes = json.loads(quotes_fh.read())
	index = random.randint(0, len(quotes))
	selected_quote = quotes[index - 1]

with open(selected_quote_file, 'w') as dest_fh:
	dest_fh.write(json.dumps(selected_quote))
