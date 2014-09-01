calc = ->
  coefficient = $('.active').attr('value')
  coefficient = parseInt(coefficient)
  square = scaling()
  $("#amount").val square
  $("#square-value").html(square)
  price = coefficient * square
  $("#price-value").html(price)
  $("#fake-price-value").html(Math.round(price * 1.25))
  return

scaling = ->
  left = parseFloat($('.ui-slider-handle')[0].style.left)
  if left <= 16.67
    scaled_square = 10 + 1.2 * left
  if (left > 16.67) && (left <= 41.67)
    scaled_square = 30 + 2.4 * (left - 16.67)
  if (left > 41.67) && (left <= 58.33)
    scaled_square = 90 + 3.6 * (left - 41.67)
  if (left > 58.33) && (left <= 83.33)
    scaled_square = 150 + 6 * (left - 58.33)
  if (left > 83.33)
    scaled_square = 300 + 12 * (left - 83.33)
  scaled_square = Math.round(scaled_square)
  return scaled_square

move_room = ->
  left = parseFloat($('.ui-slider-handle')[0].style.left)
  $('#small-room').css('left',left + '%')
  if left <= 16.67
    title = 'Комната'
  if (left > 16.67) && (left <= 44.5)
    title = 'Квартира'
  if (left > 44.5) && (left <= 66.75)
    title = 'Коттедж'
  if (left > 66.75)
    title = 'Поместье'
  $('#small-room').html("<span>" + title + "</span><br><img src='images/remont/line.png'>")
  return

$ ->
  # bxSlider initialize
  photo_slider = $('ul#want-this-slider').bxSlider
    controls: true
    pager: false

  # horisontal slider initialize
  $("#slider-range-min").slider
    range: "min"
    value: 290000
    min: 0
    max: 1000000
    slide: (event, ui) ->
      calc()
      move_room()
    stop: (event, ui) ->
      calc()
      move_room()

  # Initial data
  calc()
  move_room()
  type_text = $('.active').children('.title').first().text()
  $('#type-value').html(type_text)

  # Repair type click
  $('.rtype').click ->
    if $(this).hasClass('inactive')
      $('.active').removeClass('active').addClass('inactive')
      $(this).removeClass('inactive').addClass('active')
      calc()
      type_text = $(this).children('.title').first().text()
      $('#type-value').html(type_text)
      photo_slider.goToSlide($(this).index())

  return