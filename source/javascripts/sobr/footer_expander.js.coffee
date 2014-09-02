$(document).ready ->
  old_v = 0
  resize = ->
    $(document.body).css('paddingBottom', $('#footer').height() + 20 + 'px')
    $(document).scrollTop($("body").height())
    return


  btn = $('#footer button.navbar-toggle')
  btn.click ->
    setTimeout(resize,500)
  return