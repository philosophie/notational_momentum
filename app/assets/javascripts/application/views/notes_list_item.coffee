class Views.NotesListItem extends Backbone.View

  tagName: "li"

  template: HandlebarsTemplates["notes_list_item"]

  events:
    "click a": "onClick"

  initialize: ->
    @model.on "change", @render, @

  render: ->
    @$el.html @template(@model.toJSON())

    if @model.isSelected()
      @$el.addClass("selected")
    else
      @$el.removeClass("selected")

    @

  onClick: (event) ->
    event.preventDefault()
    @model.select()