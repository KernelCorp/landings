$(document).ready ->
  resize = ->
    $(document.body).css('paddingBottom', $('#footer').height() + 20 + 'px')
    return


  btn = $('#footer button.navbar-toggle')
  btn.click ->
    setTimeout(resize,500)
  return