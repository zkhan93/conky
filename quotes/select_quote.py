import json
import random

selected_quote = {}

with open('/home/zeeshan/.conky/quotes/data/quotes.json', 'r') as quotes_fh:
	quotes = json.loads(quotes_fh.read())
	index = random.randint(0, len(quotes))
	selected_quote = quotes[index - 1]

with open('/home/zeeshan/.conky/quotes/data/selected_quote.json', 'w') as dest_fh:
	dest_fh.write(json.dumps(selected_quote))
