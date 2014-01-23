$(document).ready ->
  $("#tiles li").wookmark
    autoResize: true # This will auto-update the layout when the browser window is resized.
    container: $("#tiles") # Optional, used for some extra CSS styling
    offset: 4 # Optional, the distance between grid items
    itemWidth: 210 # Optional, the width of a grid item
    verticalOffset: 4
    outerOffset: 6
  $("body").on "click", ".create_event", ->
    $("#new_event").ajaxForm
      dataType: "html"
      success: (result) ->
        $("#tiles").prepend result
        $("#myModal").modal "hide"
        $("#tiles li").wookmark
          autoResize: true # This will auto-update the layout when the browser window is resized.
          container: $("#tiles") # Optional, used for some extra CSS styling
          offset: 4 # Optional, the distance between grid items
          itemWidth: 210 # Optional, the width of a grid item
          verticalOffset: 4
          outerOffset: 6
    $("#new_event").submit()
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url &&  $(window).scrollTop() > $(document).height() - $(window).height() - 100
        $('.pagination').text('Fetching more products...')
        $.getScript(url)
      else
        $('.pagination').addClass('hidden')
    $(window).scroll ->