App.data = 

  banners : [
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
    image: "http://www.jacobwycoff.com/wp-content/uploads/2011/09/photo1.jpg"
    # image : "http://cdn.uproxx.com/wp-content/uploads/2012/07/tumblr_m796vkee2E1qmxn5so1_r1_500.gif"
  ,
    category: "drink"
    subtitle: "No wine. Seriously, no wine."
    image: "http://foodandwineblog.com/wp-content/uploads/2012/01/DSC_1665.jpg"
  ,
    category: "featured"
    subtitle: "Just the hits."
    image: "http://floridatheatre.com/assets/2chainz_2nd-run-e1350312473755.jpg"
  ]

  articles : [
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

for article, i in App.data.articles
  article.date = App.util.randomDate()
  article.uid = i + 1