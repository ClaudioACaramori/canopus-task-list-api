class ApplicationController < ActionController::Base
  include ApiTokenAuthenticatable

  wrap_parameters false

end
