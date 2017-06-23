$(document).ready ->
  mapContainer = document.getElementById('map-container');
  markerImage = 'https://res.cloudinary.com/djnzkhyxr/image/upload/v1498079839/pointer_iw70le.png'
  marker = map = undefined

  mapDefaultOptions =
    zoom: 15
    center:
      lat: 48.463819
      lng: 35.053189
    streetViewControl: false
    mapTypeControl: false

  geocoder = new google.maps.Geocoder();
  map = new (google.maps.Map)(mapContainer, mapDefaultOptions)

  window.reDrawMarkers = (position) ->
    map = new (google.maps.Map)(mapContainer,
      zoom: 15
      center: position
      streetViewControl: false
      mapTypeControl: false
    )

    marker = new (google.maps.Marker)(
      position: position
      map: map
      title: 'Hold and move'
      draggable: true
      icon: markerImage
    )

    marker.addListener 'dragend', ->
      geocodePosition(marker.getPosition())

    geocodePosition(marker.getPosition())

  geocodePosition = (pos) ->
    geocoder.geocode { latLng: pos }, (responses) ->
      if responses && responses.length > 0
        address = responses[0].formatted_address
        location = responses[0].geometry.location
        setLatLong(location.lng(), location.lat())
      else
        address = 'Cannot determine address at this location.'
      displayAddress(address)

  setLatLong = (longtitude, latitude) ->
    $('#task_longtitude').val(longtitude)
    $('#task_latitude').val(latitude)

  displayAddress = (address) ->
    $('.new-task-modal__address').html(address)
    $('#modal-task-address').html('My address is ' + address)

