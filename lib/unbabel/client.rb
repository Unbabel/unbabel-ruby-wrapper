module Unbabel
  class Client
    ENDPOINT = 'https://unbabel.com/tapi/v2'
    attr_accessor :username, :token


    def initialize(options = {})
      @username = options[:username]
      @token    = options[:token]

      yield(self) if block_given?
    end
  end
end
