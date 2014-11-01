module Unbabel
  module LanguangePair
    def language_pairs
      response = Unirest.get("#{Unbabel::Client::ENDPOINT}/language_pair")
      response.body['objects']
    end
  end
end
