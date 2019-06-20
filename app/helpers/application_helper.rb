module ApplicationHelper
  def get_client
    @hoopla_client = HooplaClient.hoopla_client
    @descriptor = HooplaClient.new.client.get('/')
  end

  def metric_id(metric)
    metric.href.split('/').last
  end

  def value_owner_name(owner)
    return "N/A" unless owner
    "#{owner.try(:first_name)} #{owner.try(:last_name)}"
  end

  def value_id(value)
    value.href.split('/').last
  end
end
