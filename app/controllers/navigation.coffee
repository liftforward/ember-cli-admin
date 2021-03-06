`import Ember from 'ember';`
`import config from '../config/environment';`
`import Navigation from 'ember-cli-admin/dsl/navigation';`

navigationController = Ember.ArrayController.extend
  activeMenu: "dashboard"

  model: Navigation.content

  siteTitle: config.EmberENV.appName || config.modulePrefix || 'Ember Admin'

`export default navigationController;`