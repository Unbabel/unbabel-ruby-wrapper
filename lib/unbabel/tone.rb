module Unbabel
  module Tone
    def tones
      response = Unirest.get("#{Unbabel::Client::ENDPOINT}/tone")
      response.body['objects']
    end
  end
end
