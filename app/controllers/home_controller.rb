require 'net/http'
require 'json'
require 'base64'

class HomeController < ApplicationController
  def index
  end

  def cognito
    @authorization_code = params['code']

    uri = URI.parse("https://hello-rails.auth.ap-northeast-1.amazoncognito.com/oauth2/token")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme === "https"

    params = {
        grant_type: "authorization_code",
        client_id: "vcild7756s2kr549f36a71uma",
        redirect_uri: "http://localhost:3000/home/cognito",
        code: @authorization_code
    }

    request = Net::HTTP::Post.new(uri.path)
    request.set_form_data(params)
    response = http.request(request)
    @http_status_code = response.code

    parsed_response = JSON.parse(response.body)
    id_token = parsed_response["id_token"]
    id_token_array = id_token.split(".")
    decoded_payload = Base64.decode64(id_token_array[1])
    @email = JSON.parse(decoded_payload)["email"]
  end
end
