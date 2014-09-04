$ ->
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

  $('ul#feedback-slider').bxSlider
    controls: true
    pager: true
    pagerCustom: '#bx-pager'
    adaptiveHeight: true

  $('#rent-left a').click ->
    if $(this).hasClass('inactive-link')
      $('#rent-left a.active-link').removeClass('active-link').addClass('inactive-link')
      $(this).removeClass('inactive-link').addClass('active-link')
      $('#rent-right .accordion-item.active').removeClass('active').addClass('inactive')
      index = $(this).index()
      $('#rent-right #' + index).removeClass('inactive').addClass('active')
  return