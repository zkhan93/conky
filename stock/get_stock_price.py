import sys
import json

args = sys.argv[1] if len(sys.argv) > 1 else None
content = json.loads(open('/home/zeeshan/.conky/stock/quotes.json', 'r').read())
if content and args:
  symbol, quantity, avg_price = str(args).split(' ')
  _res = content.get(symbol)
  lp = 0
  diff = 0
  if _res:
    lp = _res.get('lastPrice')
    diff = float(lp) * int(quantity) - (float(avg_price) * int(quantity))
  symbol = '{} ({})'.format(symbol, quantity)
  res = '{:0.2f} ({:+0.2f})'.format(lp, diff)
  print('{:<15} {:>20}'.format(symbol, res))
else:
  print('NA')
