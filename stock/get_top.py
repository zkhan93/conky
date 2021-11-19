import json
import sys

key = sys.argv[2]
source_file = '/home/zeeshan/.conky/stock/gainers.json' if key == 'gainer' else '/home/zeeshan/.conky/stock/losers.json'

index = int(sys.argv[1])
content = json.loads(open(source_file, 'r').read())
res = 'NA'
if content:
  res = content[index] if len(content) > index else None
  if res:
    ltp = res.get('ltp')
    open_price = res.get('openPrice')
    symbol = res.get('symbol')
    diff = ltp - open_price
    res = '{:0.2f} ({:+0.2f})'.format(ltp, diff)
    res = '{:<15} {:>20}'.format(symbol, res)
print(res)
