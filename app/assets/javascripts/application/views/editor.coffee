class Views.Editor extends Backbone.View

  $textarea: null
  $previewer: null

  currentNote: null

  events:
    "input textarea": "onTextareaInput"

  initialize: (options) ->
    _.bindAll @, "_onWindowResize"

    @notes = options.notes

    @$previewer = @$el.find(".js-previewer")
    @$textarea = @$el.find(".js-textarea")

    @$textarea.crevasse
      previewer: @$previewer

    $(window).resize(@_onWindowResize)
    $(window).trigger "resize"

    @notes.on "selected", @setCurrentNote, @
    @currentNote = @notes.selectedNote()

  render: ->
    if @currentNote
      @$textarea.val(@currentNote.get("body")).change()
      @$textarea.caretToEnd()
      @$textarea.attr("disabled", false).focus()
    else
      @$textarea.val("").change()
      @$textarea.attr("disabled", true)

    @

  setCurrentNote: (@currentNote) ->
    @render()

  clearCurrentNote: ->
    @setCurrentNote(null)

  onTextareaInput: (event) ->
    @updateNote()

  updateNote: ->
    @currentNote.set body: @$textarea.val()
    @currentNote.save()

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