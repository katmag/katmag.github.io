---
---
jQuery ($) ->
    menu-button = $('#mobile-menu-button')
    menu = $('.site-nav')
    body = $('body')
    menu-button.on "click", ->
        menu.toggleClass 'menu'
        menu-button.toggleClass 'open'
        body.toggleClass 'stop-scrolling'
