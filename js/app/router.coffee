$ ->
  
  App.router = new (Backbone.Router.extend
      
      routes:
        "/backbone-web-magazine/"                : "featured"
        "/backbone-web-magazine/article/:id"     : "singleArticle"
        "/backbone-web-magazine/category/:name"  : "categoryPage"
        "/backbone-web-magazine/author/:name"    : "authorPage"
        "*"                                      : "featured"

      singleArticle: ( id ) ->
        id = parseInt id, 10
        articleModel = new App.Models.ArticleModel _( App.data.articles ).findWhere
          uid: id

        articleModel.set 
          "empty" : true
          "truncate" : false

        articleView = new App.Views.SingleArticleView
          model : articleModel

        @banners( articleModel.get("category") ).show()
        @helpers.setTab articleModel.get "category"
        articleView.fadeRender =>
          @helpers.scrollTop( ".main-content" )
          @helpers.setPageType( "article" )
        

      categoryPage: ( name ) ->
        articleCollection = new App.Collections.ArticlesCollection _( App.data.articles ).where
          category: name

        articleCollection.invoke "set",
          "empty" : false
          "truncate" : 250

        articleView = new App.Views.CategoryArticlesView
          collection: articleCollection
          category: name
        
        @banners( name ).show()
        @helpers.setTab( name )
        articleView.fadeRender =>
          # @renderBanner( name )
          @helpers.scrollTop( "html" )
          @helpers.setPageType( "category" )

      featured : ->
        articleCollection = new App.Collections.ArticlesCollection _( App.data.articles ).where
          featured: true

        articleCollection.invoke "set",
          "empty" : false
          "truncate" : 250

        articleView = new App.Views.CategoryArticlesView
          collection: articleCollection
          category: "featured"

        # bannerModel = new App.Models.BannerModel _( App.data.banners ).findWhere
        #   category: "featured"
        # bannerView = new App.Views.CategoryBannerView
        #   model: bannerModel
        #   category: "featured"
        # bannerView.show()

        @banners( "featured" ).show()
        @helpers.setTab( "featured" )
        articleView.fadeRender =>
          @helpers.scrollTop( "html" )
          @helpers.setPageType( "category" )

      renderBanner : ( category ) ->
        bannerModel = new App.Models.BannerModel _( App.data.banners ).findWhere
          category: category
        bannerView = new App.Views.CategoryBannerView
          model: bannerModel
          category: category

        bannerView.render()

      banners : ( category ) ->
        console.log category
        return _( App.banners ).findWhere
          category: category

      # keep this jQuery crap isolated from Backbone stuff
      helpers :
        setTab : ( name ) ->
          $( ".nav-links li" ).removeClass( "selected-section" )
          $( ".nav-links .js-nav-#{ name }").addClass( "selected-section" )

        scrollTop : ( selector = ".category-banner" ) ->
          $( "body" ).animate
            scrollTop: $( selector ).offset().top
          , 400

        setPageType : ( value ) ->
          $( "body" ).attr( "data-page-type", value )

      start : ->
        Backbone.history.start pushState: true
        $(document).on 'click', 'a:not([data-bypass])', (event) ->
          event.preventDefault()
          href = $( this ).attr( "href")
          App.router.navigate href, true 

    )
        
  # App.router.start()
