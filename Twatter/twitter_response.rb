class TwitterResponse
  attr_accessor :status_code, :data

  def initialize(status_code, data)
    @status_code = status_code
    @data = data
  end
end