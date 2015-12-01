---
---
((global, $) ->

  Query = (q) ->
    if typeof q != 'undefined' and typeof q == 'string'
      @q = q
    return

  'use strict'
  Query.prototype =
    set: (val) ->
      @q = val
      this
    goToLocation: (route) ->
      if typeof @q != 'undefined' and typeof @q == 'string'
        document.location.href = route + '/?query=' + @q
      else
        return
      return
    get: ->
      @q
    setFromURL: (name) ->
      name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]')
      regex = new RegExp('[\\?&]' + name + '=([^&#]*)')
      results = regex.exec(location.search)
      @q = if results == null then '' else decodeURIComponent(results[1].replace(/\+/g, ' '))
      this
    getJSON: (file) ->
      $.get file
  global.Query = Query
  return
) this, $
