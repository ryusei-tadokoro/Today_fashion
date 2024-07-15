require 'net/http'
require 'uri'
require 'json'

class DeeplTranslator
  API_URL = 'https://api-free.deepl.com/v2/translate'

  def initialize(text, target_lang)
    @text = text
    @target_lang = target_lang
    @api_key = Rails.application.credentials.deepl[:api_key]
  end

  def translate
    uri = URI.parse(API_URL)
    request = Net::HTTP::Post.new(uri)
    request["Authorization"] = "DeepL-Auth-Key #{@api_key}"
    request.set_form_data(
      "text" => @text,
      "target_lang" => @target_lang
    )

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    result = JSON.parse(response.body)
    result["translations"].first["text"]
  rescue => e
    Rails.logger.error("Deepl translation error: #{e.message}")
    nil
  end
end
