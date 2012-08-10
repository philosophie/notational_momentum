class NM.Views.Editor extends Backbone.View

  $textarea: null
  $previewer: null

  initialize: ->
    _.bindAll @, "_onWindowResize"

    @$previewer = @$el.find(".js-previewer")
    @$textarea = @$el.find(".js-textarea")
    @$textarea.crevasse
      previewer: @$previewer

    # Automatically focus the textarea
    @$textarea.focus()

    $(window).resize(@_onWindowResize)
    $(window).trigger "resize"

  render: -> @

  _onWindowResize: ->
    # Set height of textarea and previewer
    windowHeight = $(window).height()
    headerHeight = $("header").outerHeight()
    textareaPadding = @$textarea.outerHeight() - @$textarea.height()
    @$textarea.height(windowHeight - textareaPadding - headerHeight)
    previewerPadding = @$previewer.outerHeight() - @$previewer.height();
    @$previewer.height(windowHeight - previewerPadding - headerHeight);
    # Notify crevasse of dimensions change
    @$previewer.trigger("crevasse.resize");