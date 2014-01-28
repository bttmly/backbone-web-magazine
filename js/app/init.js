// Generated by CoffeeScript 1.6.3
(function() {
  (function() {
    return $.getJSON("http://baconipsum.com/api/?type=meat-and-filler&paras=10", function(data) {
      var article, text, _i, _len, _ref, _results;
      text = "<p>" + (data.slice(0, 3).join(" ")) + "</p>\n<h3>" + (_.capitalize(data[3].split(" ").slice(0, 5).join(" "))) + "</h3>\n<p>" + (data.slice(4, 7).join(" ")) + "</p>\n<h3>" + (_.capitalize(data[8].split(" ").slice(0, 5).join(" "))) + "</h3>\n<p>" + (data.slice(9, 10).join(" ")) + "</p>";
      text.split("  ").join(" ");
      _ref = App.data.articles;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        article = _ref[_i];
        _results.push(article.content = text);
      }
      return _results;
    });
  })();

  $(function() {
    (function() {
      var categories, category, view, views, _i, _j, _len, _len1;
      views = [];
      categories = _.unique(_(App.data.articles).pluck("category"));
      for (_i = 0, _len = categories.length; _i < _len; _i++) {
        category = categories[_i];
        views.push(new App.Views.DropdownView({
          collection: new App.Collections.ArticlesCollection(_(App.data.articles).where({
            category: category
          })),
          category: category
        }));
      }
      views.push(new App.Views.DropdownView({
        collection: new App.Collections.ArticlesCollection(_(App.data.articles).where({
          featured: true
        })),
        category: "featured"
      }));
      for (_j = 0, _len1 = views.length; _j < _len1; _j++) {
        view = views[_j];
        view.render();
      }
      return _(views).findWhere({
        category: "featured"
      }).render();
    })();
    (function() {
      var banner, categories, category, _i, _j, _len, _len1, _ref;
      App.banners = [];
      categories = _.unique(_(App.data.banners).pluck("category"));
      for (_i = 0, _len = categories.length; _i < _len; _i++) {
        category = categories[_i];
        App.banners.push(new App.Views.CategoryBannerView({
          model: new App.Models.BannerModel(_(App.data.banners).findWhere({
            category: category
          })),
          category: category
        }));
      }
      App.banners.push(new App.Views.CategoryBannerView({
        model: new App.Models.BannerModel(_(App.data.banners).findWhere({
          category: "featured"
        })),
        category: "featured"
      }));
      _ref = App.banners;
      for (_j = 0, _len1 = _ref.length; _j < _len1; _j++) {
        banner = _ref[_j];
        banner.render();
      }
      return _(App.banners).findWhere({
        category: "featured"
      }).show();
    })();
    return (function() {
      return App.router.start();
    })();
  });

}).call(this);