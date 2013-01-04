class @Note extends Backbone.Model

  localStorage: new Backbone.LocalStorage("notes")

  select: ->
    @set("selected", true)
    @save()

  unselect: ->
    @set("selected", false)
    @save()

  isSelected: ->
    @get("selected")