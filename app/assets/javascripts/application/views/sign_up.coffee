class NM.Views.SignUp extends Backbone.View
  template: HandlebarsTemplates["user_form"]

  saving: false

  events:
    "submit": "_onSubmit"

  _onSubmit: (event) ->
    event.preventDefault()
    @saving = true
    @render()

  render: ->
    @$el.html @template(@)

    @$(":input").attr("disabled", @saving)

    @
