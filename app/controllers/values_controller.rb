class ValuesController < ApplicationController
  def index
    @values = value_retriver.values_with_users
  end

  def edit
    @value = value_retriver.single_value
  end

  def update
    value = value_retriver.single_value
    ValueUpdater.new(hoopla_client: @hoopla_client, params: params, value: value)
    .update
    redirect_to metric_values_path(metric_id(value.metric))
  end

  private

  def value_retriver
    ValueRetriver.new(hoopla_client: @hoopla_client, params: params)
  end
end
