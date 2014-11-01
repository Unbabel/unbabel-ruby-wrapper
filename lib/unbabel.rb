module Unbabel
  require 'pry'
  require 'unirest'

  Dir[File.dirname(__FILE__) + '/unbabel/*.rb'].each do |file|
    require file
  end

  def self.new(options = {})
    Unbabel::Client.new(options)
  end
end
