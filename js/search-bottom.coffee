---
---
jQuery ($) ->
    $ do (Query) ->
        exec_search_bottom = (e) ->
            e.preventDefault()
            query.set($('#search-input-bottom').val().trim()).goToLocation '/search'
            return
        'use strict'
        query = new Query
        $('#search-form-bottom').on 'submit', exec_search_bottom
        return
    return
