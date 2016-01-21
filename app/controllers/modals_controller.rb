class ModalsController < ApplicationController
  include ImitateDelay
  imitate_delay
  layout false
  before_action { request.format = :json }
end
