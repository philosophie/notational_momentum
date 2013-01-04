class @Notes extends Backbone.Collection

  model: Note

  localStorage: new Backbone.LocalStorage("notes")

  initialize: ->
    @on "selected", (model) ->
      @unselectAllOtherNotes(model)

  selected: ->
    @filter (note) -> note.isSelected()

  unselectAllOtherNotes: (note) ->
    for model in @models
      model.unselect() if model != note

  selectedNote: ->
    @selected()[0]

  destroySelectedNote: ->
    if selectedNote = @selectedNote()
      selectedNote.destroy()