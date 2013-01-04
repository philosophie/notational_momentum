class Views.NewNoteBar extends Backbone.View

  notes: null
  note: null

  events:
    "keydown": "onKeydown"

  initialize: (options) ->
    @notes = options.notes
    @note = new Note

  render: ->
    @$el.val @note.get("title")

  notes: (@notes) ->

  onKeydown: (event) ->
    if event.keyCode == 13
      @createNoteAndReset()
      return false

  createNoteAndReset: ->
    val = @$el.val()

    return false unless val != ""

    @note.set(title: val)
    @notes.create(@note)

    @note.select()

    @note = new Note
    @render()

  focus: ->
    @$el.focus()