#= require jquery
#= require jquery.caret
#= require jquery.scrollTo.min
#= require jquery.serialize_object
#= require jquery_ujs
#
#= require underscore
#= require backbone
#= require backbone.localStorage
#= require handlebars.runtime
#
#= require github_flavored_markdown
#= require crevasse
#
#= require_self
#= require_tree ./templates
#= require_tree ./application

@NM =
  Views: {}
  Models: {}
  Collections: {}

$ ->
  new NM.Application(el: $("body"))