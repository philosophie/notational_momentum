#= require jquery
#= require jquery.caret
#= require jquery.scrollTo.min
#= require jquery.serialize_object
#= require jquery_ujs
#= require role
#= require jquery.role
#
#= require underscore
#= require backbone
#= require backbone.localStorage
#= require handlebars
#
#= require marked
#= require crevasse
#= require keymaster
#
#= require_self
#= require_tree ./templates
#= require_tree ./application/models
#= require_tree ./application

@Views = {}

$ ->
  new Application(el: $("body"))