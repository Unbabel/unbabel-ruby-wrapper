module Unbabel
  module Translation

    # status are
    # 'new'         - The translation has been created and is being pre-processed
    # 'ready'       - The translation is ready to be processed in the unbabel platform.
    # 'in_progress' - The translation is being executed
    # 'delivered'   - The translation has already been returned to the client (either using the endpoint or query for a translation)
    def translations(status = nil)
      status = "?#{status}" if status

      response = Unirest.get("#{Unbabel::Client::ENDPOINT}/translation/#{status}")
      response.body['objects']
    end
  end
end
