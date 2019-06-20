class ValueUpdater
  include ApplicationHelper

  attr_reader :hoopla_client, :params, :value

  def initialize(options = {})
    @hoopla_client = options.fetch(:hoopla_client)
    @params = options.fetch(:params)
    @value = options.fetch(:value)
  end

  def update
    value_url = Value.new(metric_id(value.metric), value_id(value)).value_url
    value_json = value.to_h
    value_json[:value] = params[:value][:metric_value].to_f
    value_json[:owner] = value_json[:owner].to_h
    value_json[:metric] = value_json[:metric].to_h
    @hoopla_client.put(value_url, value_json)
  end
end
