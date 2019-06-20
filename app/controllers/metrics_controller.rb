class MetricsController < ApplicationController
  def index
    metrics_list_url = @hoopla_client.get_relative_url("list_metrics")
    @metrics = @hoopla_client.get(metrics_list_url)
  end
end
