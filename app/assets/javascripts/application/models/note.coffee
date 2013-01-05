class @Note extends Backbone.Model

  localStorage: new Backbone.LocalStorage("notes")

  select: (focus=true) ->
    @set("selected", true)
    @save()
    @trigger "selected", @, focus

  unselect: ->
    @set("selected", false)
    @save()

  isSelected: ->
    @get("selected")