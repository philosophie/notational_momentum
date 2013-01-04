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

    # Automatically focus the textarea
    @$textarea.focus()

    $(window).resize(@_onWindowResize)
    $(window).trigger "resize"

    @notes.on "selected", @setCurrentNote, @

    @currentNote = @notes.selectedNote()

  render: ->
    if @currentNote
      @$textarea.val(@currentNote.get("body")).change()
      @$textarea.attr("disabled", false).focus()
    else
      @$textarea.val("").change()
      @$textarea.attr("disabled", true)

    @

  setCurrentNote: (@currentNote) ->
    @render()

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