#= require ../users

class NM.Views.Users.New extends Backbone.View
  template: HandlebarsTemplates["users/new"]

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
