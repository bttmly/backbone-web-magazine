

$ ->

  Backbone.$ = jQuery

  window.App = {}
  
  # return a random date between start and end
  # start defaults to two weeks before now
  # end defaults to now
  randomDate = ( start = new Date( new Date() - 12096e5 ), end =  new Date() ) ->
    return new Date start.getTime() + Math.random() * ( end.getTime() - start.getTime() )

  randomArrayItem = ( arr ) ->
    return arr[Math.floor( Math.random() * arr.length )]

  prefetchImage = ( src ) ->
    img = new Image()
    img.src = src

  App.banners = banners = [
    category: "code"
    subtitle: "Thoughts on web design and development."
    image: "http://farm3.staticflickr.com/2326/2378867408_5d2ac25d2f_o.jpg"
  ,
    category: "eat"
    subtitle: "Food and food culture in the Bay Area."
    image: "http://24.media.tumblr.com/51c2cbdc21e51aabda946df85c0ffd0c/tumblr_mfkatySCWw1qdertso1_1280.jpg"
  ,
    category: "listen"
    subtitle: "Bands, shows, album reviews and more"
    image: "http://rivalsons.com/wp_v1/wp-content/themes/rivalsons_theme/images/slide_3.jpg"
  ,
    category: "watch"
    subtitle: "Oh, indeed."
    # image: "http://www.jacobwycoff.com/wp-content/uploads/2011/09/photo1.jpg"
    image : "http://cdn.uproxx.com/wp-content/uploads/2012/07/tumblr_m796vkee2E1qmxn5so1_r1_500.gif"
  ,
    category: "drink"
    subtitle: "No wine. Seriously, no wine."
    image: "http://foodandwineblog.com/wp-content/uploads/2012/01/DSC_1665.jpg"
  ,
    category: "featured"
    subtitle: "Just the hits."
    image: "http://floridatheatre.com/assets/2chainz_2nd-run-e1350312473755.jpg"
  ]

  App.articles = articles = [
    image: "http://www.silveradocontractors.com/images/demolitionmain.jpg"
    title: "About the Site Redesign"
    authors: ["Nick"]
    category: "code"
    featured: true
  ,
    image: "http://www.berkeleyside.com/wp-content/uploads/2013/06/pulling-out-plain-slice-720x529.jpg"
    title: "Best East Bay Pizza"
    authors: ["Patrick"]
    category: "eat"
    featured: true
  ,
    image: "http://ih1.redbubble.net/image.8403495.7664/flat,550x550,075,f.jpg"
    title: "The Ins and Outs of Backbone.js"
    authors: ["Ali"]
    category: "code"
    featured: true
  ,
    image: "http://cravedfw.files.wordpress.com/2013/07/old-fashioned.jpg"
    title: "Old Fashioned &mdash; Hold (most of) the Sugar"
    authors: ["Max"]
    category: "drink"
    featured: false
  ,
    image: "http://theversatilegent.com/wp-content/uploads/2012/10/6040127502_e0bd694669_z.jpg"
    title: "Comparison: Bulleit Rye v. Russels Reserve Rye"
    authors: ["Dave"]
    category: "drink"
    featured: false
  ,
    image: "http://3.bp.blogspot.com/-Mk-ntQrmpjs/Tv9SacvctZI/AAAAAAAAEOM/b5W_Mx09xPM/s1600/Michter%2527sWhiskey.jpg"
    title: "Sampling Michters Rye, Bourbon, and American Whiskey"
    authors: ["Dave", "Ali"]
    category: "drink"
    featured: false
  ,
    image: "http://wagesofwins.com/wp-content/uploads/2013/10/Stephen-Curry-shooting.jpg"
    title: "Using D3.js For Sports Data Visualization"
    authors: ["Patrick", "Dave"]
    category: "code"
    featured: false
  ,
    image: "http://www.eastbayexpress.com/imager/the-local-butcher-shops-roast-beef-sandwich-doesnt-disappoint/b/original/3378772/694f/food.jpg"
    title: "Review: Six Oakland Sandwich Spots"
    authors: ["Nick", "Ali", "Max"]
    category: "eat"
    featured: false
  ,
    image: "http://home.earthlink.net/~remanski/oranges.jpg"
    title: "Fruit in Season Right Now"
    authors: ["Nick", "Ali"]
    category: "eat"
    featured: false
  ,
    image: "http://www.cultistzine.com/wp-content/uploads/2013/02/hanni-el-khatib-456-050112.jpg"
    title: "Hanni El Khatib &mdash; <em>Head in the Dirt</em>"
    authors: ["Max", "Ali", "Patrick"]
    category: "listen"
    featured: false
  ,
    image: "http://userserve-ak.last.fm/serve/500/69137722/Rival%2BSons%2BRivalSons_sam4854cPNG.png"
    title: "Rival Sons &mdash; <em>Head Down</em>"
    authors: ["Nick", "Max"]
    category: "listen"
    featured: false
  ,
    image: "http://cdn.thefader.com/wp-content/uploads/2013/02/Gary_Clark_jr_620.jpg"
    title: "Gary Clark Jr. &mdash; <em>Blak and Blu</em>"
    authors: ["Nick"]
    category: "listen"
    featured: false
  ,
    image: "http://i2.cdnds.net/13/09/618x412/ustv_justified_1.jpg"
    title: "<em>Justified</em> Starts 5th Season; Will End After 6th"
    authors: ["Ali"]
    category: "watch"
    featured: false
  ,
    image: "http://www.trbimg.com/img-50c23b3e/turbine/bal-ron-swanson-thumbs-up-20121207/600"
    title: "<em>Parks & Rec</em> Is In Rare Company"
    authors: ["Patrick", "Max"]
    category: "watch"
    featured: false
  ,
    image: "http://wac.450f.edgecastcdn.net/80450F/screencrush.com/files/2014/01/True-Detective-02-786710.jpg"
    title: "New Show: HBO's <em>True Detective</em>"
    authors: ["Max", "Patrick"]
    category: "watch"
    featured: false
  ]

  categories = _.unique articles.map ( a ) ->
    return a.category

  for article, i in articles
    article.date = randomDate()
    article.uid = i + 1

  App.templates = templates =
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
      console.log data
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
            if data.shorten
              _( art.content ).truncate( 200 )
            else
              art.content

          footer class: 'article-footer', ->
        

    categoryBanner : CoffeeKup.compile ->
      div class: 'category-banner', style: "background-image: url('#{ data.image }')", ->
        h2 class: 'category-title', ->
          text _.str.capitalize data.category
          span class: "category-title__subtitle", -> data.subtitle
















  


  App.vent = _.extend {}, Backbone.Events


  class ArticleModel extends Backbone.Model

  class ArticlesCollection extends Backbone.Collection
    model: ArticleModel
    # http://stackoverflow.com/questions/9540770/using-underscore-to-sort-a-collection-based-on-date
    comparator: ( m ) ->
      if not m.get("date")
        m.set "date", randomDate()
      return -m.get( 'date' ).getTime()

  class BannerModel extends Backbone.Model

  class DropdownView extends Backbone.View
    el : ".nav-link-dropdown"
    template : templates.dropdown
    initialize: ( options ) ->
      this.setElement( ".nav-link-dropdown-" + options.category )
      this.category = options.category
      this.vent = App.vent
    render: ->

      data =
        articles : this.collection.toJSON()
        category : this.category

      this.$el.html this.template data

  class CategoryArticlesView extends Backbone.View
    el : ".main-content"
    template : templates.singleArticle
    initialize: ( options ) ->
      _.bindAll(this, "render")
      this.bind("switchToCategory", this.render)
      this.category = options.category

      this.vent = App.vent
      this.vent.bind "switchToCategory:#{ options.category }", this.render

    render: ->
      this.$el.empty()

      for article in this.collection.models
        this.renderOne( article )

        # this.$el.append this.template
        #   article: article
        #   shorten: true

    renderOne: ( model ) ->
      view = new SingleArticleView
        model: model
        parent: this
      .render(true)
  
  class SingleArticleView extends Backbone.View
    el : ".main-content"
    template: templates.singleArticle
    className: "single-article"
    initialize: ( options ) ->
      _.bindAll(this, "render")
      this.vent = App.vent

    render: ( shorten, empty ) ->

      if empty then this.$el.empty()

      this.$el.append this.template 
        article: this.model.toJSON()
        shorten: shorten

  class CategoryBannerView extends Backbone.View
    el : ".category-hero"
    template: templates.categoryBanner
    initialize: ( options ) ->
      _.bindAll(this, "render")
      this.bind("switchToCategory", this.render)
      this.category = options.category

      this.vent = App.vent
      this.vent.bind "switchToCategory:#{ options.category }", this.render

    render: ->
      console.log this.model.toJSON()
      this.$el.html this.template this.model.toJSON()

  App.articleModels = []
  App.bannerModels = {}
  App.articleCollections = {}
  App.dropdownViews = {}
  App.categoryArticlesViews = {}
  App.categoryBannerViews = {}

  for article in articles
    App.articleModels.push new ArticleModel article

  App.articleCollections.featured = new ArticlesCollection App.articleModels.filter ( m ) ->
      return m.get("featured")

  App.dropdownViews.featured = new DropdownView 
    collection: App.articleCollections.featured
    category: "featured"
  
  App.categoryArticlesViews.featured = new CategoryArticlesView
    collection: App.articleCollections.featured
    category: "featured"

  for category in categories
    # articleCollections[category] = new ArticlesCollection _.where articles, { category: _.str.capitalize( category ) }
    App.articleCollections[category] = new ArticlesCollection App.articleModels.filter ( m ) ->
      return m.get("category") is category

    App.bannerModels[category] = new BannerModel _.findWhere banners, { category: category }

    # the dropdown view gets the three most recent articles in the category
    App.dropdownViews[category] = new DropdownView
      collection: App.articleCollections[category]
      category: category

    App.categoryArticlesViews[category] = new CategoryArticlesView
      collection: App.articleCollections[category]
      category: category

  for banner in banners
    App.categoryBannerViews[banner.category] = new CategoryBannerView
      model: new BannerModel banner
      category: banner.category

  for key in Object.keys( App.dropdownViews )
    App.dropdownViews[key].render()









  $ ->
    App.router = new (Backbone.Router.extend
      
      routes:
        ""                : "featured"
        "article/:id"    : "singleArticle"
        "category/:name" : "categoryPage"

      singleArticle: ( id ) ->
        this.scrollTop()

        id = parseInt id, 10
        articleModel = new ArticleModel _( App.articles ).findWhere
          uid: id
        articleView = new SingleArticleView
          model : articleModel
        articleView.render( false, true )

        this.renderBanner articleModel.get "category"
        this.setTab articleModel.get "category"

        $( "body" ).attr( "data-page-type", "article" )
        

      categoryPage: ( name ) ->
        console.log "CP started"
        # console.log categoryName
        articleCollection = new ArticlesCollection _( App.articles ).where
          category: name
        articleView = new CategoryArticlesView
          collection: articleCollection
          category: name
        articleView.render()

        this.setTab( name )
        this.renderBanner( name )
        $( "body" ).attr( "data-page-type", "category" )
        this.scrollTop()

      featured : ->
        articleCollection = new ArticlesCollection _( App.articles ).where
          featured: true
        articleView = new CategoryArticlesView
          collection: articleCollection
          category: "featured"
        articleView.render()

        bannerModel = new BannerModel _( App.banners ).findWhere
          category: "featured"
        bannerView = new CategoryBannerView
          model: bannerModel
          category: "featured"
        bannerView.render()

        this.setTab( "featured" )
        $( "body" ).attr( "data-page-type", "category" )
        this.scrollTop()

      renderBanner : ( category ) ->
        bannerModel = new BannerModel _( App.banners ).findWhere
          category: category
        bannerView = new CategoryBannerView
          model: bannerModel
          category: category
        bannerView.render()

      setTab : ( name ) ->
        console.log name
        $( ".nav-links li" ).removeClass( "selected-section" )
        $( ".nav-links .js-nav-#{ name }").addClass( "selected-section" )

      scrollTop : ->
        $( "body" ).animate
          scrollTop: $( ".category-banner" ).offset().top
        , 400

      )
        
        

      
    initializeRouter = ->
      console.log "ROUTER INITIALIZED"
      Backbone.history.start { pushState: true }
      $(document).on 'click', 'a:not([data-bypass])', (event) ->
        event.preventDefault()

        href = $(this).attr('href');

        protocol = this.protocol + '//';

        App.router.navigate href, true 

        # if href.slice protocol.length isnt protocol
        #   event.preventDefault()
        #   App.router.navigate href, true 

    initializeRouter()




















  ###  
  $( "body" ).on "click", "[data-category]", ( event ) ->
    event.preventDefault()

    category = $(this).data("category")

    $( ".nav-links > .selected-section" ).removeClass("selected-section")
    $( ".nav-links > li > a[data-category=#{ category }]" ).parent( "li" ).addClass( "selected-section" )

    App.categoryBannerViews[category].trigger( "switchToCategory" )
    App.categoryArticlesViews[category].trigger( "switchToCategory" )
  ###

  $.getJSON "http://baconipsum.com/api/?type=meat-and-filler&paras=10" , ( data )->
    text = """
<p>#{ data.slice(0,3).join( " " )}</p>
<h3>#{ _.capitalize data[3].slice(0,5) }</h3>
<p>#{ data.slice(4,7).join( " " )}</p>
<h3>#{ _.capitalize data[8].slice(0,5) }</h3>
<p>#{ data.slice(9,10).join( " " )}</p>
"""
    text.split( "  " ).join( " ")
    for model in App.articles
      model.content = text

    # $( ".nav-links > li > a[data-category='featured']" ).click()  

    console.log "Ready."
    console.log "another thing"

