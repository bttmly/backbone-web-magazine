class BaseView extends Backbone.View

  initialize: ( options ) ->

    for key in Object.keys( options )
      this[key] = options[key]

    this.vent = App.vent

    this.fadeRender = ( callback ) => 
      
      view = this

      fadeDuration = 200

      if this.$el.is ":hidden"
        this.render()
        this.$el.fadeIn fadeDuration, =>
          if callback? and _.isFunction( callback )
            callback()

      else if App.util.isEmpty this.$el
        this.$el.hide()
        
        this.$el.fadeIn fadeDuration, =>
          if callback? and _.isFunction( callback )
            callback()
            this.render()
      else
        this.$el.fadeOut fadeDuration, =>
          view.render()
          if callback? and _.isFunction( callback )
            callback()
          this.$el.fadeIn fadeDuration

  close: -> 
    this.unbind()
    this.model.unbind( 'change', this.render, this )
    this.options.parent.unbind( 'close:all', this.close, this )
    this.remove()
    delete this.$el
    delete this.el

class ArticleView extends BaseView
  initialize : ( options ) ->

    # call initialize( options ) on BaseView
    super options





###             ###
###             ###
###    MODELS   ###
###             ###
###             ###




App.Models =

  ArticleModel : class ArticleModel extends Backbone.Model

  BannerModel : class BannerModel extends Backbone.Model




###             ###
###             ###
### COLLECTIONS ###
###             ###
###             ###




App.Collections =

  ArticlesCollection : class ArticlesCollection extends Backbone.Collection
    model: App.Models.ArticleModel
    # http://stackoverflow.com/questions/9540770/using-underscore-to-sort-a-collection-based-on-date
    comparator: ( m ) ->
      if not m.get("date")
        m.set "date", App.util.randomDate()
      return -m.get( 'date' ).getTime()





###             ###
###             ###
###    VIEWS    ###
###             ###
###             ###





App.Views =

  DropdownView : class DropdownView extends Backbone.View
    el: ".nav-link-dropdown"
    template: App.templates.dropdown
    initialize: ( options ) ->
      this.setElement( ".nav-link-dropdown-" + options.category )
      this.category = options.category
      this.vent = App.vent
    render: ->

      data =
        articles : this.collection.toJSON()
        category : this.category

      this.$el.html this.template data

  CategoryArticlesView : class CategoryArticlesView extends BaseView
    el: ".main-content"
    template: App.templates.singleArticle

    initialize : ( options ) ->
      super( options )

    render: =>
      this.$el.empty()
      for article in this.collection.models
        this.renderOne( article )

    renderOne: ( model ) =>
      view = new App.Views.SingleArticleView
        model: model
        # parent: this
      .render()
  
  SingleArticleView : class SingleArticleView extends BaseView
    el : ".main-content"
    template: App.templates.singleArticle
    className: "single-article"

    initialize : ( options ) ->
      super( options )

    render: =>
      if this.model.get( "empty" ) then this.$el.empty()
      this.$el.append this.template 
        article: this.model.toJSON()
        shorten: this.model.get "truncate"

  CategoryBannerView : class CategoryBannerView extends BaseView
    el : ".category-hero"
    template: App.templates.categoryBanner
    initialize: ( options ) ->
      super( options )
      # _.bindAll(this, "render")
      # this.bind("switchToCategory", this.render)
      # this.category = options.category

      # this.vent = App.vent
      # this.vent.bind "switchToCategory:#{ options.category }", this.render

      # this.vent = App.vent

    render: =>
      this.$el.append this.template this.model.toJSON()

    show: =>
      console.log  this.category
      this.$el.find( ".category-banner" ).css
        opacity: 0
        zIndex: -1
      this.$el.find( ".category-banner-#{ this.category }").css
        opacity: 1
        zIndex: 1