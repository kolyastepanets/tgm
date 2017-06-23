$(document).ready ->

  $(document).on 'click', '#task-services', (event) ->
    if $(event.target).hasClass('service-name')
      toggleActive(event)
      updateTitle()
      setHiddenService()

  $(document).on 'keyup', '#task-input-description', (e) ->
    updateTitle()

  toggleActive = (event) ->
    $('.service-name').removeClass('active-service')
    $(event.target).addClass('active-service')

  updateTitle = () ->
    description = $('#task-input-description').val()
    serviceType = $('#task-services .active-service').data('service-name')
    serviceName = $('#task-services .active-service').data('service-type')

    if (serviceType && serviceName)
      title = 'I need a '+serviceType+' to '+serviceName+', '+description
    else
      title = description

    $('#modal-task-title').html(title)

  setHiddenService = () ->
    activeServiceId = $('#task-services .active-service').data('service-id')
    $('#task_service_id').val(activeServiceId)
