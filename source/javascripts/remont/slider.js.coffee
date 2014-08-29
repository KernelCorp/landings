$ ->
  $("#slider-range-min").slider
    range: "min"
    value: 60
    min: 10
    max: 500
    slide: (event, ui) ->
      $("#amount").val ui.value
      return

  $("#amount").val $("#slider-range-min").slider("value")
  return