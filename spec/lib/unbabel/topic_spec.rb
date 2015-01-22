require 'spec_helper'

describe Unbabel::Topic do
  include Unbabel::Topic

  it 'returns an array of hashes' do
    expected = [{
      'topic' => {'name' => 'politics'},
      'topic' => {'name' => 'gossip'}
    }].to_json

    stub_request(:get, "http://sandbox.unbabel.com/tapi/v2/topic")
      .to_return(:body => {'objects' => expected }  )

      expect(topics).to eq expected
  end
end
