window.form_submit = (form) ->
  order = $(form).serialize()
  order = order + "&RANGE=" + $('.ui-slider-handle input').val()+ "&TYPE=" + $('.active .title').text()
  $.ajax
    type: "POST"
    url: "/ajax/orderform.php"
    data: order
    success: (data) ->
      alert "Данные успешно отправлены"
    error: (xhr, str) ->
      alert "Возникла ошибка: " + xhr.responseCode
      return
  return