$(document).ready ->
  serviceId = serviceName = serviceType = marker = map = undefined
  dniproLatLng =
    lat: 48.463819
    lng: 35.053189

  mapDefaultOptions =
    zoom: 15
    center: dniproLatLng
    streetViewControl: false
    mapTypeControl: false

  geocoder = new google.maps.Geocoder();
  map = new (google.maps.Map)(document.getElementById('map-container'), mapDefaultOptions)

  $(document).on 'click', '#task-services', (event) ->
    if $(event.target).hasClass('service-name')
      setServiceVars(event)
      setHiddenValues()
      activateSelectedService(event)
      $('#modal-task-title').html(returnServiceTitle())

  $(document).on 'keyup', '#task-input-description', (event) ->
    $('.short-title').html(event.target.value)

  setHiddenValues = () ->
    document.querySelector('#task_title').value = returnServiceTitle()
    document.querySelector('#task_service_id').value = serviceId

  setServiceVars = (event) ->
    serviceId = event.target.getAttribute('service-id')
    serviceName = event.target.getAttribute('service-name')
    serviceType = event.target.getAttribute('service-type')

  setLatLong = (longtitude, latitude) ->
    document.querySelector('#task_longtitude').value = longtitude
    document.querySelector('#task_latitude').value = latitude

  activateSelectedService = (event) ->
    $('.service-name').removeClass('active-service')
    $(event.target).addClass('active-service')

  returnServiceTitle = () ->
    return 'I need a ' + serviceType + ' to ' + serviceName + ','

  geocodePosition = (pos) ->
    geocoder.geocode { latLng: pos }, (responses) ->
      if responses && responses.length > 0
        marker.formatted_address = responses[0].formatted_address
        location = responses[0].geometry.location
        setLatLong(location.lng(), location.lat())
      else
        marker.formatted_address = 'Cannot determine address at this location.'
      $('.new-task-modal__address').html(marker.formatted_address)
      $('#modal-task-address').html('My address is ' + marker.formatted_address)
      return
    return

  window.initMarker = (position) ->
    map = new (google.maps.Map)(document.getElementById('map-container'),
      zoom: 15
      center: position
      streetViewControl: false
      mapTypeControl: false)

    image = 'https://res.cloudinary.com/djnzkhyxr/image/upload/v1498079839/pointer_iw70le.png'
    marker = new (google.maps.Marker)(
      position: position
      map: map
      title: 'Hold and move'
      draggable: true
      icon: image
      )

    marker.addListener 'dragend', ->
      geocodePosition(marker.getPosition())
      return

    geocodePosition(marker.getPosition())
