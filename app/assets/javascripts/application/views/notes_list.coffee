class Views.NotesList extends Backbone.View

  KEY_CODES:
    "enter": 13
    "down": 40
    "up": 38

  notes: null
  listItems: null

  events:
    "click": "onClick"
    "focus @title": "onTitleFocus"
    "keydown @title": "onTitleKeydown"
    "input @title": "onTitleInput"

  initialize: (options) ->
    @notes = options.notes

    @listItems = []

    @$searchResultsContainer = @$("@search_results")
    @$searchResults = @$searchResultsContainer.find("ul")

    @$title = @$("@title")

    @notes.on "add remove", @refreshListItems, @
    @notes.on "selected", @setCurrentNote, @

    if @notes.length > 0
    	@refreshListItems() 
    	@setCurrentNote @notes.selectedNote()
    else 
      @createIntroNotes()

    $("body").click => @hide()

  refreshListItems: ->
    @filteredNotes = @notes.searchByTitle(@$title.val())
    @listItems = []
    for note in @filteredNotes
      @listItems.push new Views.NotesListItem(model: note)
    @render()
    @moveSelectionTo(0, false)

  render: ->
    @$searchResults.empty()
    @$searchResults.append(listItem.render().el) for listItem in @listItems
    @

  focusTitle: ->
    @$title.focus()

  hide: ->
    @$searchResultsContainer.hide()

  show: ->
    @$searchResultsContainer.show()

  onClick: (event) ->
    event.stopPropagation()

  onTitleFocus: ->
    @show()

  onTitleInput: ->
    @currentNote = null
    @refreshListItems()

  onTitleKeydown: (event) ->
    switch event.keyCode
      when @KEY_CODES["enter"]
        if @currentNote?
          @currentNote.select()
        else
          @createNote()
        @hide()
        return false
      when @KEY_CODES["down"]
        @moveSelectionDown()
        return false
      when @KEY_CODES["up"]
        @moveSelectionUp()
        return false

  createNote: ->
    val = @$title.val()

    return false unless val != ""

    note = new Note(title: val)
    @notes.create(note)

    note.select()

  setCurrentNote: (@currentNote, open=true, setTitle=true) ->
    @hide() if open
    @$title.val @currentNote.get("title") if setTitle

  clearCurrentNote: ->
    @$title.val("")
    @refreshListItems()
    
  createIntroNotes: =>
    $.getJSON("intro.json", (data) =>
      $.each(data, (index, item) =>
        note = new Note(title: item.titleVal, body: item.noteVal)
        @notes.create(note)
      )
    )
    
  moveSelectionDown: ->
    @moveSelectionTo _.indexOf(@filteredNotes, @currentNote) + 1

  moveSelectionUp: ->
    @moveSelectionTo _.indexOf(@filteredNotes, @currentNote) - 1

  moveSelectionTo: (index, setTitle=true) ->
    return unless index >= 0 && index < @filteredNotes.length
    note = @filteredNotes[index]
    note.select(false, setTitle)
    
