require 'spec_helper'

describe Unbabel::LanguangePair do
  include Unbabel::LanguangePair

  it 'returns an array of hashes' do
    expected = [{
      "lang_pair"=> {
      "source_language"=>{"name"=>"Portuguese", "shortname"=>"pt"}, 
      "target_language"=>{"name"=>"English", "shortname"=>"en"}}
    }].to_json
      

    stub_request(:get, "http://sandbox.unbabel.com/tapi/v2/language_pair")
      .to_return(:body => {'objects' => expected }  )

      expect(language_pairs).to eq expected
  end
end
