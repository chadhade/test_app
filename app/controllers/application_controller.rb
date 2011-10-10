class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper # includes the sessions helper in all controllers, they are in all views by default
end
