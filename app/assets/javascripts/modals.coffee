$ ->
  modal_selector   = '#modal'
  modal_active_key = 'askpiter.active'
  modal_owner_key  = 'askpiter.owner'
  modal_title_key  = 'askpiter.title'
  modal_body_key   = 'askpiter.body'
  modal_data_key   = 'askpiter.data'
  cacheable_key    = 'askpiter.cacheable'

  spinner_data = ->
    title: 'Loading page...'
    body: $('#spinner').html()

  open_modal = ->
    modal = $ modal_selector
    return unless modal.length
    modal.data modal_active_key, true

    owner = $ this
    owner.data cacheable_key, cacheable = !owner.attr('data-disable-cache')

    unless same_owner(modal, owner) && cacheable

      modal.data modal_owner_key,  owner
      modal.data modal_title_key,  modal.find '.modal-title'
      modal.data modal_body_key,   modal.find '.modal-body'

      if cacheable && data = owner.data modal_data_key
        update_modal modal, data
      else
        update_modal modal, spinner_data()

        form = owner.find 'form'
        $.ajax form.attr('action'),
          data:    form.serialize()
          method:  form.attr('method')
          success: (data) -> process_modal_data(modal, data, owner)

    modal.modal()
    true

  same_owner = (modal, owner) ->
    owner.is modal.data modal_owner_key

  process_modal_data = (modal, data, owner) ->
    owner.data modal_data_key, data if owner.data cacheable_key
    return unless modal.data(modal_active_key) && same_owner(modal, owner)
    update_modal modal, data
    true

  update_modal = (modal, data) ->
    modal.data(modal_title_key).text data.title || ''
    modal.data(modal_body_key).html data.body || ''
    true

  $(document).on 'hide.bs.modal', modal_selector, ->
    $(this).data modal_active_key, false
    true

  $(document).on 'click', 'button.show-modal', open_modal

  true
