class @Notes extends Backbone.Collection

  model: Note

  localStorage: new Backbone.LocalStorage("notes")

  initialize: ->
    @on "selected", (model) ->
      @unselectAllOtherNotes(model)

  selected: ->
    @filter (note) -> note.isSelected()

  searchByTitle: (str) ->
    regexp = new RegExp(@escapeStringForRegExp(str), "i")
    @filter (note) -> note.get("title").search(regexp) >= 0

  unselectAllOtherNotes: (note) ->
    for model in @models
      model.unselect() if model != note

  selectedNote: ->
    @selected()[0]

  destroySelectedNote: ->
    if selectedNote = @selectedNote()
      selectedNote.destroy()

  escapeStringForRegExp: (str) ->
    str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&")