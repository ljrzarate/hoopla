class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception
  before_action :get_client
  helper_method :metric_id, :value_id, :value_owner_name

end
