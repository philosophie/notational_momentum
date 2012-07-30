class NM.Views.Editor extends Backbone.View
  crevassed: false

  render: ->
    unless @crevassed
      @$el.crevasse()
      @crevassed = true

    @
