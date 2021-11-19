
#/bin/bash
sleep 1;
# for sidebar
conky -c /home/zeeshan/.conky/sidebar/.conkyrc &
# for daily quotes
conky -c /home/zeeshan/.conky/quotes/.conkyrc &
# for share, this is giving python error, fix stock fetch parse script before enablinig it
# conky -c /home/zeeshan/.conky/stock/.conkyrc_stock &
# for parcel tracking
conky -c /home/zeeshan/.conky/parcel/.conkyrc &