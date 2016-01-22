class ModalsController < ApplicationController
  include ImitateDelay
  before_action { request.format = :json }
  imitate_delay
  layout false
end
