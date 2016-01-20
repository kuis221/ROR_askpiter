class ModalsController < ApplicationController
  layout false
  before_action { request.format = :json }
end
