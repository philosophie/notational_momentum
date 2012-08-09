class NM.Views.Editor extends Backbone.View
  crevassed: false

  render: ->
    unless @crevassed
      console.log "lol"
      $previewer = @$el.children("div")
      @$el.children("textarea").crevasse(previewer: $previewer)
      @crevassed = true

    @
