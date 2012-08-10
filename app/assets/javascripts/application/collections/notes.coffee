class NM.Collections.Notes extends Backbone.Collection

  model: NM.Models.Note
  localStorage: new Backbone.LocalStorage("SomeCollection")