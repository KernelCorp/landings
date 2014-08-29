$ ->
  coefficient = $('.active').attr('value')
  coefficient = parseInt(coefficient)
  type_text = $('.active').children('.title').first().text()
  $('#type-value').html(type_text)
  square = parseInt($('#square-value').text())
  price = coefficient * square
  $("#price-value").html(price)
  $("#fake-price-value").html(Math.round(price * 1.223))

  $('.rtype').click ->
    if $(this).hasClass('inactive')
      $('.active').removeClass('active').addClass('inactive')
      $(this).removeClass('inactive').addClass('active')
      coefficient = $('.active').attr('value')
      coefficient = parseInt(coefficient)
      type_text = $(this).children('.title').first().text()
      $('#type-value').html(type_text)
      square = parseInt($('#square-value').text())
      price = coefficient * square
      $("#price-value").html(price)
      $("#fake-price-value").html(Math.round(price * 1.223))
  return
