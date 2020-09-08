class ContentfulService
  def initialize
    @base_uri = "https://cdn.contentful.com/spaces/#{ENV['SPACE_ID']}/environments/#{ENV['ENVIRONMENT_ID']}"
  end

  def fetch_recipes(include_depth: 2)
    uri = URI("#{base_uri}/entries?access_token=#{ENV['ACCESS_TOKEN']}&include=#{include_depth}&content_type=recipe")
    request = Net::HTTP::Get.new(uri)
    response = make_request(uri, request)
    process_response response
  end

  private

  attr_reader :base_uri

  def make_request(uri, request)
    use_ssl = { :use_ssl => uri.scheme == 'https' }
    Net::HTTP.start(uri.host, uri.port, use_ssl) do |http|
      http.request(request)
    end
  end

  def process_response(response)
    if response.code == "200"
      JSON.parse(response.body)
    else
      # TODO implement error
    end
  end
end