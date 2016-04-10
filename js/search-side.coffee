---
---
jQuery ($) ->
    $ do (Query) ->
        exec_search_side = (e) ->
            # stop the form from doing its default behavior
            e.preventDefault()
            # set the query, and go to the search page with our query URL
            query.set($('#search-input-side').val().trim()).goToLocation '/search'
            return
        'use strict'
        query = new Query
        $('#search-form-side').on 'submit', exec_search_side
        search_icon = $('#search-icon-side')
        search_input = $('#search-input-side')
        search_icon.click (e) ->
            e.preventDefault()
            search_input.toggleClass 'hidden'
            search_input.focus()
            return
        return
    return
