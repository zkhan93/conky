local iface = ''

function get_active_iface()
    if not iface or iface == '' then
        iface = conky_parse('${gw_iface 0}')
    end
    local str = string.format('${if_up %s}1${else}0${endif}', iface)
    local stillup = conky_parse(str)
    if stillup == '0' then
        str = string.format('${%s %d}', 'gw_iface',0)
        iface = conky_parse(str)
    end
    return iface
end

function conky_activeiface(command)
    local str = ''
    local liface = ''
    liface = get_active_iface()
    if not liface then
        return ''
    end
    str = string.format('${%s %s}', command, liface)
    str = conky_parse(str)
    return str
end