$(document).ready ->
  serviceId = serviceName = serviceType = undefined

  $(document).on 'click', '#task-services', (event) ->
    getServiceAttributes(event)
    setHiddenValues()
    activateSelectedService(event)
    $('#modal-task-title').html(returnServiceTitle())

  $(document).on 'keyup', '#task-input-description', (event) ->
    taskDescription = event.target.value
    $('.short-title').html(taskDescription)

  # $('.new-task-btn').on 'click', (event) ->

  $('.new-task-btn').mouseup ->
    debugger
    #Do stuff here
    return


  setHiddenValues = () ->
    document.querySelector('#task_title').value = returnServiceTitle()
    document.querySelector('#task_service_id').value = serviceId

  getServiceAttributes = (event) ->
    serviceId = event.target.getAttribute('service-id')
    serviceName = event.target.getAttribute('service-name')
    serviceType = event.target.getAttribute('service-type')

  setLatLong = (longtitude, latitude) ->
    document.querySelector('#task_longtitude').value = longtitude
    document.querySelector('#task_latitude').value = latitude

  activateSelectedService = (event) ->
    $('.active-service').removeClass('active-service')
    if $(event.target).hasClass('service-name')
      $(event.target).addClass('active-service')

  returnServiceTitle = () ->
    return 'I need a ' + serviceType + ' to ' + serviceName

  dniproLat = 48.463819
  dniproLng = 35.053189

  myLatlng =
    lat: dniproLat
    lng: dniproLng

  geocoder = new google.maps.Geocoder();

  geocodePosition = (pos) ->
    geocoder.geocode { latLng: pos }, (responses) ->
      if responses && responses.length > 0
        marker.formatted_address = responses[0].formatted_address
        location = responses[0].geometry.location
        setLatLong(location.lng(), location.lat())
      else
        marker.formatted_address = 'Cannot determine address at this location.'
      $('.new-task-modal__address').html(marker.formatted_address)
      return
    return

  map = new (google.maps.Map)(document.getElementById('map-container'),
    zoom: 15
    center: myLatlng)
  marker = new (google.maps.Marker)(
    position: myLatlng
    map: map
    title: 'Click and move'
    draggable: true
    # icon: iconBase + 'parking_lot_maps.png'
    )
  marker.addListener 'dragend', ->
    geocodePosition(marker.getPosition())
    return
