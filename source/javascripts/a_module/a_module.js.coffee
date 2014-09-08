class PopupController
  constructor: ->
    $('.order-call').click @show_popup
    $('.order-request').click @show_popup
    $('#popup-background').click @hide_popup
    $('.close-button').click @hide_popup
    return

  show_popup: ->
    $('#popup-background').fadeIn(500)
    $('#popup-container').fadeIn(500)
    if $(this).hasClass('order-call')
      $('#popup-call').fadeIn(500)
    if $(this).hasClass('order-request')
      $('#popup-request').fadeIn(500)
    return
  hide_popup: ->
    $('#popup-background').fadeOut(500)
    $('#popup-container').fadeOut(500)
    $('#popup-call').fadeOut(500)
    $('#popup-request').fadeOut(500)

$ ->
  #Init popups
  new PopupController
  #Popup fix
  $('#popup-container').click (event) ->
    return if event.target isnt this
    $('#popup-background').fadeOut(500)
    $('#popup-container').fadeOut(500)
    $('#popup-call').fadeOut(500)
    $('#popup-request').fadeOut(500)

  #Init price range
  $("#slider-range").slider
    range: true
    min: 0
    max: 999
    values: [
      0
      700
    ]
    slide: (event, ui) ->
      $("#amount").val ui.values[0] + " - " + ui.values[1]
      return

  #Init bxslider
  $('ul#feedback-slider').bxSlider
    controls: true
    pager: true
    pagerCustom: '#bx-pager'
    adaptiveHeight: true

  #Accordion code
  $('#rent-left a').click ->
    if $(this).hasClass('inactive-link')
      $('#rent-left a.active-link').removeClass('active-link').addClass('inactive-link')
      $(this).removeClass('inactive-link').addClass('active-link')
      $('#rent-right .accordion-item.active').removeClass('active').addClass('inactive')
      index = $(this).index()
      $('#rent-right #' + index).removeClass('inactive').addClass('active')

  return
