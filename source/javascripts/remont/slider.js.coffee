$ ->
  $("#slider-range-min").slider
    range: "min"
    value: 60
    min: 10
    max: 500
    slide: (event, ui) ->
      $("#amount").val ui.value
      $("#square-value").html(ui.value)
      coefficient = $('.active').attr('value')
      coefficient = parseInt(coefficient)
      price = coefficient * ui.value
      $("#price-value").html(price)
      $("#fake-price-value").html(Math.round(price * 1.223))
      return

  $("#amount").val $("#slider-range-min").slider("value")
  return