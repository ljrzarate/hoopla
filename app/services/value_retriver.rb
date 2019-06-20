class ValueRetriver

  attr_reader :hoopla_client, :params

  def initialize(options = {})
    @hoopla_client = options.fetch(:hoopla_client)
    @params = options.fetch(:params)
  end

  def values_with_users
    values_url = Value.new(params[:metric_id]).values_per_metric_url
    values = hoopla_client.get(values_url)
    user_per_value(values)
  end

  def single_value
    values_url = Value.new(params[:metric_id], params[:id]).value_url
    values = hoopla_client.get(values_url)
  end

  private

  def user_per_value(values_json)
    values = []
    values_json.each do |value|
      if value.owner.kind == User::HOOPLA_TYPE
        user_url = User.new(value.owner).user_url
        user_info = @hoopla_client.get(user_url)
        values << {value: value, user: user_info}
      end
    end
    values
  end

end
