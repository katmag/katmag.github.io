---
---
((global, $) ->

  TagQuery = () ->
    return

  'use strict'
  TagQuery.prototype =
    get: ->
      @tq
    setFromURL: (name) ->
      name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]')
      regex = new RegExp('[\\?&]' + name + '=([^&#]*)')
      results = regex.exec(location.search)
      @tq = if results == null then '' else decodeURIComponent(results[1].replace(/\+/g, ' '))
      this
    getJSON: (file) ->
      $.get file
  global.TagQuery = TagQuery
  return
) this, $
