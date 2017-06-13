$(document).ready ->
  # $('.best_in_place').best_in_place()
  # $(".chosen-select").select2
  #   tags: true
  #   maximumSelectionLength: 5
  # $('.chosen-select').on 'select2:select', (e) ->
  #   if e.params.data.id == e.params.data.text
  #     createSkill = ->
  #       $.post
  #         url: '/skills.json'
  #         data: {
  #           skill: {
  #              name: e.params.data.text,
  #              classification: e.target.id.slice(10,14)
  #           }
  #         }
  #     handleData = (data) ->
  #       selectedElement = e.target.options[e.target.options.length - 1]
  #       selectedElement.value = data.id
  #       return

  #     createSkill().done handleData

  $.ajax
    url: '/tasks.json'
    type: 'GET'
    dataType: 'script'
    success: (data) ->
      debugger
      $('#wrapper').append(data)
