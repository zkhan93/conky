from nsetools import Nse
import json

nse = Nse()
# gainers
gainers = nse.get_top_gainers()
if len(gainers) > 0:
  with open('/home/zeeshan/.conky/stock/gainers.json', 'w') as gainers_fh:
    gainers_fh.write(json.dumps(gainers[:5]))
# losers
loosers = nse.get_top_losers()
if len(loosers) > 0:
  with open('/home/zeeshan/.conky/stock/losers.json', 'w') as losers_fh:
    losers_fh.write(json.dumps(loosers[:5]))
# quotes
quotes = {}
with open('/home/zeeshan/.conky/stock/stocks', 'r') as stock_fh:
  stocks = stock_fh.read()
  if stocks:
    stocks = stocks.split('\n')
    for stock in stocks:
      stock = stock.split(' ')[0]
      quotes[stock] = nse.get_quote(stock)
if len(quotes) > 0:
  with open('/home/zeeshan/.conky/stock/quotes.json', 'w') as quotes_fh:
    quotes_fh.write(json.dumps(quotes))