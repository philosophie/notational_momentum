class @Application extends Backbone.View

  initialize: ->
    @notes = new Notes
    @notes.fetch()

    @notesList = new Views.NotesList(el: $("@notes_list"), notes: @notes)
    @editor = new Views.Editor(el: $(".js-editor"), notes: @notes).render()

    # @editor.on "focus", @onEditorFocus, @

    @setupKeyboardShortcuts()

  setupKeyboardShortcuts: ->
    # Allow shortcuts while in textareas/inputs
    key.filter = -> true

    key "ctrl+l", => @notesList.focusTitle()
    key "ctrl+esc", => @confirm @destroySelectedNote

  destroySelectedNote: =>
    @notes.destroySelectedNote()
    @editor.clearCurrentNote()

  confirm: (fn) ->
    fn() if confirm("Are you sure?")

  onEditorFocus: (event) ->
    @notesList.hide()