$ ->

  $(document).on 'shown.bs.modal', '#modal', ->
    $(this).find('.modal-body').focus()
    true

  $(document).on 'click', 'button.show-modal', (event) ->
    modal = $ '#modal'
    form  = $(this).find 'form'

    title = modal.find '.modal-title'
    body  = modal.find '.modal-body'

    title.text 'Loading page...'
    body.html $('#spinner').html()

    $.ajax form.attr('action'),
      method: form.attr('method')
      data: form.serialize()
      success: (data) ->
        title.text data.title || ''
        body.html data.body || ''

    modal.modal()
    true

  true
