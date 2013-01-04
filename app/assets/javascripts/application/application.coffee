class @Application extends Backbone.View

  initialize: ->
    @notes = new Notes
    @notes.fetch()

    @newNoteBar = new Views.NewNoteBar(el: $(".js-new_note_bar"), notes: @notes)
    @notesList = new Views.NotesList(el: $(".js-notes_list"), notes: @notes)
    @editor = new Views.Editor(el: $(".js-editor"), notes: @notes).render()

    @setupKeyboardShortcuts()

  setupKeyboardShortcuts: ->
    # Allow shortcuts while in textareas/inputs
    key.filter = -> true

    key "ctrl+l", => @newNoteBar.focus()

    key "ctrl+esc", =>
      @confirm @destroySelectedNote

  destroySelectedNote: =>
    @notes.destroySelectedNote()
    @editor.setCurrentNote(null)

  confirm: (fn) ->
    fn() if confirm("Are you sure you want to delete your note?")