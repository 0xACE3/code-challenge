require "faraday"


def fetch(url, method = :get, params = nil, headers = nil)
  conn = Faraday.new(url: url) do |faraday|
    faraday.request :url_encoded
    faraday.adapter Faraday.default_adapter
  end

  response = conn.send(method, url, params, headers)
  {
    status: response.status,
    content: response.body
  }
end

