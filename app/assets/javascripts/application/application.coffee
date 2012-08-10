class NM.Application extends Backbone.View

  editor: null
  status: null

  initialize: ->
    @titleBar = new NM.Views.TitleBar(el: $("js-title_bar")).render()
    @editor = new NM.Views.Editor(el: $(".js-editor")).render()
    @status = new NM.Views.Status(el: $(".js-status")).render()