require 'cairo'

function draw(display)
    local x, y = 20, 50
    local font_size = 11
    local small_font_size = font_size - 2
    local font = 'Roboto Mono Light'
    local line_gap = 10
    local width = conky_window.width
    local size = cairo_text_extents_t:create()

    local function get_width(text, fsize)
        cairo_select_font_face (display, font, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
        cairo_set_font_size (display, fsize)    
        cairo_text_extents(display, text, size);
        return size.width
    end
    
    cairo_select_font_face (display, font, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size (display, font_size)

    local str, stock = '', ''
    local text_width = 0
-- shares 1st block
    for i=1,3 do    
        str = string.format('${exec cat ~/.conky/stock/stocks | sed -n %dp}', i)
        if not str or str == '' then
            break
        end
        stock = conky_parse(str)
        str = string.format('${exec /home/zeeshan/repos/stocks/venv/bin/python ~/.conky/stock/get_stock_price.py "%s"}', stock)
        val = conky_parse(str)
        cairo_move_to(display, 0, y);
        cairo_show_text(display, val);
        
        y = y + 20
    end

    -- top gainers
    y = y + 50
    for i=0,2 do
        str = string.format('${exec /home/zeeshan/repos/stocks/venv/bin/python ~/.conky/stock/get_top.py %d gainer}', i)
        val = conky_parse(str)
        cairo_move_to(display, 0, y);
        cairo_show_text(display, val);
        
        y = y + 20 
    end
-- top loosers
    y = y + 50
    for i=0,2 do
        str = string.format('${exec /home/zeeshan/repos/stocks/venv/bin/python ~/.conky/stock/get_top.py %d loser}', i)
        val = conky_parse(str)
        cairo_move_to(display, 0, y);
        cairo_show_text(display, val);

        y = y + 20 
    end

end

function conky_main()
    if conky_window == nil then 
        return
    end

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)
    local updates=conky_parse('${updates}')
    update_num=tonumber(updates)

    if update_num>5 then
        draw(display)
    end
    
    cairo_surface_destroy(cs)
    cairo_destroy(display)
end
