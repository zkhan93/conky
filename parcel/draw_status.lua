
function conky_trackings()
  local handle = io.popen("~/.conky/parcel/bin/count.sh")
  local n = handle:read("*a")
  handle:close()
  listtracking = ""
  for i = 1,tonumber(n) do
    listtracking = listtracking.."${execi 360 ~/.conky/parcel/bin/get_updates.sh "..tostring(i).."}${voffset 5}\n"
  end
  return listtracking
end

function conky_string(value)
 return tostring(value)
end
