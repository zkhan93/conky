require 'cairo'


function showquote(display)
    local x, y = 20, 35
    local font_size = 45
    local author_font_size = 14
    local line_gap = 4
    cairo_move_to (display, x, y)
    -- Font Ubuntu
    cairo_select_font_face (display, "Biloxi Script", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size (display, font_size)
    -- 
    local width = conky_window.width
    local size = cairo_text_extents_t:create()
    for i=1,10 do
        local line = conky_parse(string.format('${exec jshon -F ~/.conky/quotes/data/selected_quote.json -e quote -u | fmt -w 50 -s | sed -n %sp}', i))
        if not line or line == '' then
            break
        end
        cairo_text_extents(display, line, size);
        cairo_move_to(display, x + width/2 - size.width/2, y);
        cairo_show_text(display, line);
        y = y + size.height + line_gap
    end
    local author = conky_parse(string.format('${exec jshon -F ~/.conky/quotes/data/selected_quote.json -e author -u}'))
    author = string.format('- %s', author)
    cairo_set_font_size (display, author_font_size);
    -- Montserrat Light
    cairo_select_font_face (display, "Comfortaa", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
    cairo_text_extents(display, author, size);
    cairo_move_to (display, x + width/2 - size.width/2, y)
    cairo_show_text (display, author);
    -- loaded = true
end

function conky_main()
    if conky_window == nil then 
        return
    end

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)
    
    showquote(display)
    
    cairo_surface_destroy(cs)
    cairo_destroy(display)
end
