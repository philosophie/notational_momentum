class @Application extends Backbone.View

  initialize: ->
    @notes = new Notes
    @notes.fetch()

    @list = new Views.NotesList(el: $("@notes_list"), notes: @notes)
    @editor = new Views.Editor(el: $(".js-editor"), notes: @notes).render()

    # @editor.on "focus", @onEditorFocus, @

    @setupKeyboardShortcuts()

  setupKeyboardShortcuts: ->
    # Allow shortcuts while in textareas/inputs
    key.filter = -> true

    key "ctrl+l", => @list.focusTitle()
    key "ctrl+esc", => @confirm @destroySelectedNote

  destroySelectedNote: =>
    @notes.destroySelectedNote()
    @editor.clearCurrentNote()
    @list.clearCurrentNote()

  confirm: (fn) ->
    fn() if confirm("Are you sure?")

  onEditorFocus: (event) ->
    @list.hide()