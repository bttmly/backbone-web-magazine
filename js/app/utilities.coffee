App.util = 
  
  randomDate : ( start = new Date( new Date() - 12096e5 ), end =  new Date() ) ->
    return new Date start.getTime() + Math.random() * ( end.getTime() - start.getTime() )

  randomArrayItem : ( arr ) ->
    return arr[Math.floor( Math.random() * arr.length )]

  prefetchImage : ( src ) ->
    img = new Image()
    img.src = src

  mixinArrayMethods : ->
    # Underscore methods that we want to implement on Array.
    methods = ['each', 'map', 'reduce', 'reduceRight', 'detect', 'select',
      'reject', 'all', 'any', 'include', 'invoke', 'pluck', 'max', 'min', 'sortBy',
      'sortedIndex', 'toArray', 'size', 'first', 'rest', 'last', 'without',
      'indexOf', 'lastIndexOf', 'isEmpty', 'unique']

    # Mix in each method as a proxy.
    _.each methods, (method) ->
      Array.prototype[method] = ->
        return _[method].apply _, [this].concat _.toArray arguments

  isEmpty : ( $el ) ->
    return not $.trim $el.html