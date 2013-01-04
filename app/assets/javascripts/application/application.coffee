class @Application extends Backbone.View

  initialize: ->
    @notes = new Notes
    @notes.fetch()

    @newNoteBar = new Views.NewNoteBar(el: $(".js-new_note_bar"), notes: @notes)
    @notesList = new Views.NotesList(el: $(".js-notes_list"), notes: @notes)
    @editor = new Views.Editor(el: $(".js-editor")).render()

    @setupKeyboardShortcuts()

  setupKeyboardShortcuts: ->
    # Allow shortcuts while in textareas/inputs
    key.filter = -> true

    key "ctrl+l", => @newNoteBar.focus()