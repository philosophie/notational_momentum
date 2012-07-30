#= require_tree ./views

VIEWS =
  ".js-editor": NM.Views.Editor
  ".js-status": NM.Views.Status

$ ->
  for selector, klass of VIEWS
    new klass(el: element).render() for element in $(selector)
