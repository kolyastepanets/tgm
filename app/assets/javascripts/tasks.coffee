$(document).ready ->
  serviceId = serviceName = serviceType = descriptionTask = address = undefined

  $(document).on 'click', '#task-services', {}, (event) ->
    descriptionTask = ''
    getServiceAttributes(event)
    setHiddenValues()
    chooseSelectedService(event)
    $('#modal-task-title').html(returnServiceTitle())
    return

  $(document).on 'click', '.btn-apply-task-description', {}, (e) ->
    descriptionTask = document.querySelector('.task-input-description').value
    if descriptionTask
      $(this).hide()
      $('.task-input-description').hide()
      $('.task-description').show()
      $('.task-description').html(descriptionTask)
    if serviceName && serviceType
      $('#modal-task-title').html(returnServiceTitle())
      document.querySelector('#task_title').value = returnServiceTitle()
    return

  $(document).on 'click', '.task-description', {}, (e) ->
    $(this).hide()
    $('.task-input-description').show()
    $('.btn-apply-task-description').show()
    return

  setHiddenValues = () ->
    document.querySelector('#task_title').value = returnServiceTitle()
    document.querySelector('#task_service_id').value = serviceId

  getServiceAttributes = (event) ->
    serviceId = event.target.getAttribute('service-id')
    serviceName = event.target.getAttribute('service-name')
    serviceType = event.target.getAttribute('service-type')

  chooseSelectedService = (event) ->
    $('.round-selected-task-service').removeClass('round-selected-task-service')
    if $(event.target).hasClass('service-name')
      $(event.target).addClass('round-selected-task-service')

  returnServiceTitle = () ->
    if descriptionTask
      return 'I need a ' + serviceType + ' to ' + serviceName + ', ' + descriptionTask
    else
      return serviceName

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
      else
        marker.formatted_address = 'Cannot determine address at this location.'
      document.querySelector('#task_address').value = marker.formatted_address
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
