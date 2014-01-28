# get JSON data for articles and set their content attributes
do ->
  $.getJSON "http://baconipsum.com/api/?type=meat-and-filler&paras=10" , ( data ) ->
    text = """
<p>#{ data.slice(0,3).join( " " )}</p>
<h3>#{ _.capitalize data[3].split( " " ).slice(0,5).join( " " ) }</h3>
<p>#{ data.slice(4,7).join( " " )}</p>
<h3>#{ _.capitalize data[8].split( " " ).slice(0,5).join( " " ) }</h3>
<p>#{ data.slice(9,10).join( " " )}</p>
"""
    text.split( "  " ).join( " ")
    for article in App.data.articles
      article.content = text


# anything using jQuery ( incl. rendering any initial views)
$ ->

  # render dropdown views
  do ->

    views = []
    categories = _.unique _( App.data.articles ).pluck "category"

    for category in categories
      views.push new App.Views.DropdownView
        collection : new App.Collections.ArticlesCollection _( App.data.articles ).where
          category: category
        category : category

    views.push new App.Views.DropdownView
      collection: new App.Collections.ArticlesCollection _( App.data.articles ).where
        featured: true
      category: "featured"

    for view in views
      view.render()

    _( views ).findWhere
      category: "featured"
    .render()

  # render banner views
  do ->

    App.banners = []
    categories = _.unique _( App.data.banners ).pluck "category"

    for category in categories
      App.banners.push new App.Views.CategoryBannerView
        model : new App.Models.BannerModel _( App.data.banners ).findWhere
          category: category
        category : category

    App.banners.push new App.Views.CategoryBannerView
      model: new App.Models.BannerModel _( App.data.banners ).findWhere
        category: "featured"
      category: "featured"

    for banner in App.banners
      banner.render()

    _( App.banners ).findWhere
      category: "featured"
    .show()

  do ->
    App.router.start