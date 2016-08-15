---
---
jQuery ($) ->
  $ do (TagQuery) ->
    tag_query = new TagQuery
    site = location.protocol + '//' + location.host
    tag_query.setFromURL('tag').getJSON('/posts-for-tags.json').done (data) ->
      $results = $('#tag-results')
      $.each data, (i, item) ->
        if tag_query.get() in item.tags.split(',')
          $results.append '<a class="post-link" href="' + site + item.url + '"><div class="grid-item-whole"><div class="img" style="background-image:url(\'../images/' + item.image + '\')"></div><div class="grid-item-text"><h4 class="grid-text-category">' + item.tags.split(',').join(' • ') + '</h4><h3 class="grid-text-title">' + item.title + '</h3></div></div></a>'
        return
    return
  return
