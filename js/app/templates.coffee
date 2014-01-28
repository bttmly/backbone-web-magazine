App.templates =





  dropdown : CoffeeKup.compile ->
    header class: 'dropdown-header', ->
      p -> "Recent Articles"
    div class: 'dropdown-columns', ->
      for article, i in data.articles
        break if i > 2
        div class: 'dropdown-column', ->
          div class: 'article-snippet-image', 'style' : "background-image: url('#{ article.image }')", ->
          a class: 'article-link', href: "/article/#{ article.uid }", ->
            h2 class: 'snippet-title', -> article.title
          if article.authors.length
            p class: 'article-snippet-authors', ->
              text 'by '
              for author, i in article.authors
                span class: 'article-snippet-author', ->
                  if i is article.authors.length - 1
                    "<a href='author/#{ author }'>#{ author }</a>"
                  else if i is article.authors.length - 2
                    "<a href='author/#{ author }'>#{ author }</a> and "
                  else
                    "<a href='author/#{ author }'>#{ author }</a>, "
          if article.category
            p class: 'article-snippet-tags', -> "Filed in #{ _.str.capitalize( article.category ) }"
          if article.date
            d = article.date.toString().split( ' ' )
            p class: 'article-snippet-date', -> "#{d[0]} #{d[1]} #{d[2]} #{d[3]}"
    footer class: 'dropdown-footer', ->
      url = if data.category is "featured" then "/" else "/category/#{ data.category }"
      a class: 'category-link', href: url, ->
        p ->
          text "Read More in "
          span class: 'dropdown-category', ->
            _.str.capitalize data.category





  singleArticle : CoffeeKup.compile ->
    art = data.article
    article ->
        header class: 'article-header', ->
          div class: 'article-info', ->
            a class: 'article-link', href: "/article/#{ art.uid }", ->
              h2 class: 'article-title', -> art.title
            p class: 'article-authors', ->
              text 'by '
              for author, i in art.authors
                span class: 'article-snippet-author', ->
                  if i is art.authors.length - 1
                    "<a href='author/#{ author }'>#{ author }</a>"
                  else if i is art.authors.length - 2
                    "<a href='author/#{ author }'>#{ author }</a> and "
                  else
                    "<a href='author/#{ author }'>#{ author }</a>, "
            p class: 'article-date', -> 
              d = art.date.toString().split( ' ' )
              text "#{d[0]} #{d[1]} #{d[2]} #{d[3]}"
          div class: 'article-image', style : "background-image: url( #{ art.image } );"

        section class: 'article-body', -> 
          if !data.shorten
            art.content
          else
            _( art.content ).truncate( data.shorten )
            
        footer class: 'article-footer', ->
      




  categoryBanner : CoffeeKup.compile ->
    div class: "category-banner category-banner-#{ data.category }", style: "background-image: url('#{ data.image }')", ->
      h2 class: 'category-title', ->
        text _.str.capitalize data.category
        span class: "category-title__subtitle", -> data.subtitle