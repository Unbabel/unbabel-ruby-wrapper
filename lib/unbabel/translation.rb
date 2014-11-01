module Unbabel
  module Translation

    # finds a translation by it's unique id
    def find(uid)
      response = Unirest.get("#{Unbabel::Client::ENDPOINT}/translation/#{uid}")
      response.body
    end

    # text (required)            - the text to be translated.
    # target_language (required) - the language to translate the text to.
    # source_language            - the language of text. If not supplemented it will be auto detected from the text.
    # text_format                - The format of the text to be translated [one of text,html].
    # target_text                - initial version of the text to be post-edited.
    # uid                        - A unique identifier for the job. If one is not supplied the system will provide one.
    # callback_url               - Once the job is done the result will be posted to this endpoint.
    # formality (optional)       - The tone that should be used in the translation.
    # instructions (optional)    - Client instructions for the translator.
    # topics (optional)          - List of the topics of text.
    def request(params = {})
      response = Unirest.post("#{Unbabel::Client::ENDPOINT}/translation/",
                        parameters: params.to_json)
      response.body
    end

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
