require "net/http"
require "json"

class HomeController < ApplicationController
  def index
  end

  def cognito
    @code = params['code']

    uri = URI.parse("https://hello-rails.auth.ap-northeast-1.amazoncognito.com/oauth2/token")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme === "https"

    params = {
        grant_type: "authorization_code",
        client_id: "vcild7756s2kr549f36a71uma",
        redirect_uri: "http://localhost:3000/home/cognito",
        code: @code
    }
    headers = {"Content-Type" => "application/x-www-form-urlencoded"}

    response = http.post(uri.path, params.to_json, headers)

    @status_code = response.code
    @response_body = response.body
  end
end
