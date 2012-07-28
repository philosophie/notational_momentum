#= require_tree ./views

$ ->
  new NM.Editor(el: $(".js-editor")).render()