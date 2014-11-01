module Unbabel
  module Topic
    def topics
      response = Unirest.get("#{Unbabel::Client::ENDPOINT}/topic")
      response.body['objects']
    end
  end
end
