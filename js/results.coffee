---
---
jQuery ($) ->
  $ do (Query) ->
    query = new Query
    site = location.protocol + '//' + location.host
    query.setFromURL('query').getJSON('/posts.json').done (data) ->
      searchIndex = undefined
      results = undefined
      $resultsCount = $('.search-results-count')
      $results = $('.search-results')
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
      for res_item of results
        results[res_item].title = data.filter((post) ->
          post.url == results[res_item].ref
        )[0].title
        results[res_item].image = data.filter((post) ->
          post.url == results[res_item].ref
        )[0].image
        results[res_item].tags = data.filter((post) ->
          post.url == results[res_item].ref
        )[0].tags
      $resultsCount.append results.length + (if results.length == 1 then ' result' else ' results') + ' for "' + query.get() + '"'
      $.each results, (i, result) ->
        $results.append '<a class="post-link" href="' + site + result.ref + '"><div class="grid-item-whole"><div class="img" style="background-image:url(\'../images/' + result.image + '\')"></div><div class="grid-item-text"><h4 class="grid-text-category">' + result.tags.split(',').join(' • ') + '</h4><h3 class="grid-text-title">' + result.title + '</h3></div></div></a>'
        return
    return
  return
