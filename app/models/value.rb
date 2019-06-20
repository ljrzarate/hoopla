class Value
  attr_reader :metric_id, :value_id
  VALUE_LIST_URL  = "/metrics/<metric_id>/values"
  VALUE_URL       = "/metrics/<metric_id>/values/<value_id>"

  def initialize(metric_id, value_id=nil)
    @metric_id  = metric_id
    @value_id   = value_id
  end

  def values_per_metric_url
    VALUE_LIST_URL.gsub("<metric_id>", metric_id)
  end

  def value_url
    VALUE_URL.gsub("<metric_id>", metric_id).gsub("<value_id>", value_id)
  end
end
