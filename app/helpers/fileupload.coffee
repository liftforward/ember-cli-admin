`import Ember from 'ember';`
`import DragAndDropZoneView from '../views/admin/fileupload/drag-and-drop-zone';`

fileupload = Ember.Handlebars.registerHelper "fileupload", (property, options) ->
  options.hash.inputOptions = Ember.copy(options.hash)
  options.hash.property = property
  return Ember.Handlebars.helpers.view.call(this, DragAndDropZoneView, options)


`export default fileupload`