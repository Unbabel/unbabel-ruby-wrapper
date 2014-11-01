require './lib/unbabel/topic'
require './lib/unbabel/tone'
require './lib/unbabel/language_pair'

module Unbabel
  class Client
    SANDBOX  = 'http://sandbox.unbabel.com/tapi/v2'
    ENDPOINT = SANDBOX # 'https://unbabel.com/tapi/v2'

    include Unbabel::Topic
    include Unbabel::Tone
    include Unbabel::LanguangePair

    attr_accessor :username, :token


    def initialize(options = {})
      @username = options[:username]
      @token    = options[:token]

      yield(self) if block_given?
      validate_credentials!
      Unirest.default_header('Content-Type', 'application/json')
      Unirest.default_header('Authorization', "ApiKey #{@username}:#{@token}")
    end

    def credentials
      {
        username: username,
        token:    token
      }
    end

    def credentials?
      credentials.values.all?
    end

    private
    # Ensures that all necessary credentials
    # are set during configuration.
    def validate_credentials!
      credentials.each do |credential, value|
        next if !value.nil? && value.is_a?(String)
        fail(ArgumentError.new("Invalid #{credential}, it's value: #{value.inspect} must be a string."))
      end
    end
  end
end
