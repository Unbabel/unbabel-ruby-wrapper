require 'spec_helper'

describe Unbabel::Tone do
  include Unbabel::Tone

  it 'returns an array of hashes' do
    expected = [
      {"tone"=> {"description"=>"Informal style", "name"=>"Informal"}},
      {"tone"=> {"description"=>"Friendly style", "name"=>"Friendly"}}
    ].to_json

    stub_request(:get, "http://sandbox.unbabel.com/tapi/v2/tone")
      .to_return(:body => {'objects' => expected }  )

      expect(tones).to eq expected
  end
end
