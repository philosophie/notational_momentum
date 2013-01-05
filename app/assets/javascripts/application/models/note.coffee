class @Note extends Backbone.Model

  localStorage: new Backbone.LocalStorage("notes")

  select: (open=true, setTitle=true) ->
    @set("selected", true)
    @save()
    @trigger "selected", @, open, setTitle

  unselect: ->
    @set("selected", false)
    @save()

  isSelected: ->
    @get("selected")