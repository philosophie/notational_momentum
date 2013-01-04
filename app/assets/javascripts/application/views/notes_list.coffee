class Views.NotesList extends Backbone.View

  notes: null
  listItems: null

  initialize: (options) ->
    @notes = options.notes
    @listItems = []

    @_refreshListItems() if @notes.length > 0

    @notes.on "add", @_refreshListItems, @

  _refreshListItems: ->
    @listItems = []
    for note in @notes.models
      @listItems.push new Views.NotesListItem(model: note)
    @render()

  render: ->
    @$el.empty()
    @$el.append(listItem.render().el) for listItem in @listItems
    @