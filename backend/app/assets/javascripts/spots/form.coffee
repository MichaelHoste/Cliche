refreshMap = ->
  new google.maps.Map(document.getElementById('map'), {
    center: {lat: parseFloat($('#spot_latitude').val()), lng: parseFloat($('#spot_longitude').val())},
    zoom: 19
  });


$ ->
  if $('#admin-spots-edit').length
    refreshMap()

    $('#spot_latitude, #spot_longitude').on('change', ->
      refreshMap()
    )
