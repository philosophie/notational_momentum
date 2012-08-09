class NM.Views.SignUp extends Backbone.View
  template: HandlebarsTemplates["user_form"]

  errorMessage: null
  saving: false

  events:
    "submit": "_onSubmit"

  initialize: ->
    @$el.html @template(@)

    _.bindAll(@, "_onSaveError", "_onSaveSuccess")

    @user = new NM.Models.User()

  render: ->
    @$(":input").attr("disabled", @saving)
    @$(".js-errors").text(@errorMessage)

    @

  _onSubmit: (event) ->
    event.preventDefault()

    @saving = true

    attributes = @$(":input").serializeObject()
    @user.save(attributes, error: @_onSaveError, success: @_onSaveSuccess)

    @render()

  _onSaveError: (model, request) ->
    errors = JSON.parse(request.responseText).errors

    messages = for attribute, attributeErrors of errors
      attribute + " " + attributeErrors.join(", ")

    @errorMessage = messages.join(". ")
    @saving = false

    @render()

  _onSaveSuccess: ->
    NM.user = @user

    @trigger("done")
