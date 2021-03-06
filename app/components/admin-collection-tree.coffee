`import Ember from 'ember'`

view = Ember.CollectionView.extend
  classNames: ['sortable_tree', 'nested_set', 'ui-sortable']
  tagName: 'ol'

  itemViewClass: Ember.View.extend
    templateName: 'admin/base/tree/collection'
    tagName: 'li'
    attributeBindings: ['liId:data-id']

    liId: (->
      @get('content').id
    ).property('content')

    item: Ember.computed.alias('content')

  children: (->
    @get('content')
  ).property('content')

  initSortable:(->
    @$().nestedSortable({
      handle: 'div',
      listType: 'ol',
      items: 'li',
      toleranceElement: '.tree-item_wrap',
      placeholder: 'placeholder'
    })
    self = @
    @$().on 'sortupdate', (event, ui) =>
      self.rebuild.call(self, event, ui)
  ).on('didInsertElement')


  rebuild: (event, ui) ->

    item = ui.item
    itemId = item.data('id')
    prevId = item.prev().data('id')
    nextId = item.next().data('id')
    parentId = item.parent().parent().data('id')

    itemObject = @get('controller.model.items').find (item) =>
      item.id.toString() == itemId.toString()

    @get('controller').send('rebuild', itemObject, prevId, nextId, parentId)

`export default view;`