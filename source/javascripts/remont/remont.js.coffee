$ ->
  $('.rtype').click ->
    if $(this).hasClass('inactive')
      $('.active').removeClass('active').addClass('inactive')
      $(this).removeClass('inactive').addClass('active')
  return