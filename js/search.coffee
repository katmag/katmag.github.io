---
---
jQuery ($) ->
    $ do (Query) ->
        exec = (e) ->
            # stop the form from doing its default behavior
            e.preventDefault()
            # set the query, and go to the search page with our query URL
            query.set($('.search-box').val().trim()).goToLocation '/search'
            return
        'use strict'
        query = new Query
        $('.search-form').on 'submit', exec
        search-icon = $('.search-icon')
        search-box = $('.search-box')
        search-icon.on "click", ->
            search-box.toggleClass 'hidden'
            search-box.focus()
        return
    return
