---
---
jQuery ($) ->
    menu-icon = $('.menu-icon')
    menu = $('.site-nav')
    body = $('body')
    menu-icon.on "click", ->
        menu.toggleClass 'menu'
        menu-icon.toggleClass 'close-menu-icon'
        body.toggleClass 'stop-scrolling'
