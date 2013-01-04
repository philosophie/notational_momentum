class @Note extends Backbone.Model

  localStorage: new Backbone.LocalStorage("notes")

  select: ->
    @set("selected", true)
    @save()
    @trigger "selected", @

  unselect: ->
    @set("selected", false)
    @save()

  isSelected: ->
    @get("selected")