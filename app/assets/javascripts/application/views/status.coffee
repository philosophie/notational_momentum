class NM.Views.Status extends Backbone.View
  template: HandlebarsTemplates["status"]
  subview: null

  events:
    "click .js-sign_up": "_onSignUpClick"

  _onSignUpClick: (event) ->
    event.preventDefault()

    @subview = new NM.Views.Users.New()

    @render()

  render: ->
    @$el.empty()

    if @subview
      @$el.append(@subview.render().$el)
    else
      @$el.html(@template(@))
