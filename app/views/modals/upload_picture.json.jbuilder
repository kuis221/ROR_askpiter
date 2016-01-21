json.title 'Select an image file to upload'
json.body render partial: 'pictures/upload', formats: %i(html)
json.events do
  json.set! 'ajax:remotipartSubmit' do
    json.title 'Uploading...'
    json.spinner true
  end
  # json.set! 'ajax:success' do
  #   json.close true
  # end
end
