---
---
jQuery ($) ->
  $ do (Query) ->
    query = new Query
    site = location.protocol + '//' + location.host
    query.setFromURL('query').getJSON('/posts-for-search.json').done (data) ->
      searchIndex = undefined
      results = undefined
      $resultsCount = $('#search-results-count')
      $results = $('#search-results')
      result = undefined
      searchIndex = lunr(->
        @field 'title'
        @field 'category'
        @field 'content'
        @ref 'url'
        @field 'date'
        @field 'image'
        @field 'tags'
        return
      )
      $.each data, (i, item) ->
        searchIndex.add item
        return
      results = searchIndex.search(query.get())
      resultUrls = []
      $.each results, (i, result) ->
        resultUrls.push result.ref
        return
      $resultsCount.append results.length + (if results.length > 1 && results.length < 10 then ' rezultatai' else if results.length == 1 then ' rezultatas' else ' rezultatų')
      $.each data, (i, item) ->
        if item.url in resultUrls
          $results.append '<a class="post-link" href="' + site + item.url + '"><div class="grid-item-whole"><div class="img" style="background-image:url(\'../images/' + item.image + '\')"></div><div class="grid-item-text"><h4 class="grid-text-category">' + item.tags.split(',').join(' • ') + '</h4><h3 class="grid-text-title">' + item.title + '</h3></div></div></a>'
        return
    return
  return
