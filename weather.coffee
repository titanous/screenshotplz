page = new WebPage()

if phantom.args.length != 2
  console.log 'Usage: weather.coffee city output'
  phantom.exit()
else
  query = encodeURIComponent('weather ' + phantom.args[0])
  page.viewportSize = width: 1024, height: 768
  page.open "http://google.com/search?q=#{query}", (status) ->
    if status != 'success'
      console.log 'Unable to load the address!'
      phantom.exit(1)
    else
      page.includeJs "http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js", ->
        coordinates = page.evaluate ->
          weather = jQuery('.obcontainer')
          weatherTables = jQuery('.obcontainer table')
          if weatherTables.length > 1
            weatherTables.last().remove()
          if weather.length > 0
            data = weather.offset()
            data.height = weather.height()
            data.width = weather.width()
            return data
          else
            return false
        if coordinates
          page.clipRect = coordinates
          page.render(phantom.args[1])
          phantom.exit()
        else
          console.log "No weather found"
          phantom.exit(1)
