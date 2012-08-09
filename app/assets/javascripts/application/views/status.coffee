class NM.Views.Status extends Backbone.View
  template: HandlebarsTemplates["status"]

  events:
    "click .js-sign_up": "_onSignUpClick"

  _onSignUpClick: (event) ->
    event.preventDefault()

    console.log "LOL"

    new NM.Views.Users.New().render()

  render: ->
    @$el.html @template(@)
