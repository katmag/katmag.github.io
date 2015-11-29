---
---
jQuery ($) ->
    win = $(window)
    fxel = $('.site-nav')
    page_content = $('.page-content')
    eloffset = fxel.offset().top
    win.scroll ->
      if eloffset < win.scrollTop()
        if fxel.hasClass('menu') == true
            fxel.addClass 'addnavsizemargin'
        else
            fxel.addClass 'fixed'
            page_content.addClass 'addnavsizemargin'
      else
        fxel.removeClass 'fixed'
        page_content.removeClass 'addnavsizemargin'
      return
