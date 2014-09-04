$(document).ready ->
  old_v = 0
  resize = ->
    height = $('#footer').height()
    if height > old_v
      $(document.body).addClass('expand')
    else
      $(document.body).removeClass('expand')
    old_v = height
    $(document).scrollTop($("body").height())
    return


  btn = $('#footer button.navbar-toggle')
  btn.click ->
    setTimeout(resize,500)
  return