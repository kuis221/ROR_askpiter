class ModalsController < ApplicationController
  include ImitateDelay
  layout false
  before_action { request.format = :json }
  imitate_delay
end
