$ ->

  $(document).on 'shown.bs.modal', '#modal', ->
    $(this).find('.modal-body').focus()
    true

  $(document).on 'click', 'button.show-modal', (event) ->
    action = $(this).data('action')

    modal  = $ '#modal'
    body   = modal.find '.modal-body'
    title  = modal.find '.modal-title'
    button = modal.find '.btn-primary'

    body.html $('#spinner').html()
    title.text 'Loading page...'
    button.addClass 'hidden'

    $.ajax "/modals/#{action}",
      success: (data) ->
        body.html data.body || ''
        title.text data.title || ''
        button.text data.button || ''
        button.removeClass 'hidden' if data.button

    modal.modal()
    true

  true
