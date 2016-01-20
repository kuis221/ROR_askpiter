$ ->
  $(document).on 'click', 'a.enlarge-image', (event) ->
    event.preventDefault()
    thumbnail = $(this).children('img').first()
    large = $('#large-image')
    if thumbnail && large
      large.attr 'src', thumbnail.attr('data-src')
      large.attr 'alt', thumbnail.attr('alt')
    false
  true
