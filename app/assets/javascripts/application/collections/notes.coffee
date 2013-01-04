class @Notes extends Backbone.Collection

  model: Note

  localStorage: new Backbone.LocalStorage("notes")

  initialize: ->
    @on "change", (model) ->
      @unselectAllOtherNotes(model) if model.isSelected()

  selected: ->
    this.filter (note) -> note.isSelected()

  unselectAllOtherNotes: (note) ->
    for model in @models
      model.unselect() if model != note