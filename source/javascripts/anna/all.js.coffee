#= require ../jquery-2.1.1
#= require ../jquery.bxslider
#=require bootstrap/tab

$(document).ready ->
  $('#header_text_slider').bxSlider
    auto: true
    pause: 5000
    mode: 'fade'
    controls: false
    pager: false

  $('#actions_news').bxSlider
    pager: true
    controls: false
  return