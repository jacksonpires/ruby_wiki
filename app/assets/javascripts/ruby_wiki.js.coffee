RUBY_WIKI = {}

# application-wide functions
RUBY_WIKI['common'] =
  init: ->

RUBY_WIKI['pages'] =
  init: ->

  new: ->
    @form()

  edit: ->
    @form()

  form: ->
    @setupPreview()
    @getNewPreview()

  setupPreview: ->
    self = @

    $('#page_body').on 'input propertychange', self.getNewPreview

  getNewPreview: ->
    $.get "/pages/#{$('#page_slug').val()}/preview",
      markdown: $('#page_body').val()
    , (response) ->
      $('#currentPreview').html response.html_body

UTIL =
  exec: (controller, action) ->
    namespace = RUBY_WIKI
    action = (if (action is `undefined`) then 'init' else action)
    namespace[controller][action]() if controller isnt '' and namespace[controller] and typeof namespace[controller][action] is 'function'

  init: ->
    body = document.body
    controller = body.getAttribute('data-controller')
    action = body.getAttribute('data-action')

    UTIL.exec 'common'
    UTIL.exec controller
    UTIL.exec controller, action

$(document).on 'ready page:load', UTIL.init
