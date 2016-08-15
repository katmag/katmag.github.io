---
---
jQuery ($) ->
    menubutton = $('#mobile-menu-button')
    menu = $('.site-nav')
    body = $('body')
    menubutton.on "click", ->
        menu.toggleClass 'menu'
        menubutton.toggleClass 'open'
        body.toggleClass 'stop-scrolling'
    menubutton.hover (->
        menubutton.children().toggleClass 'hovercolor'
        return
    ), ->
        menubutton.children().toggleClass 'hovercolor'
        return
