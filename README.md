[![Build Status](https://travis-ci.org/Davidslv/unbabel-ruby-wrapper.svg)](https://travis-ci.org/Davidslv/unbabel-ruby-wrapper)

# Unbabel Ruby Wrapper

[Unbabel](https://unbabel.com/) is a translation as a service, this is a ruby wrapper around their [API](https://github.com/Unbabel/unbabel_api).

Happy Translations!


## Configuration

```ruby

client = Unbabel::Client.new do |conf|
  conf.username = ENV['UNBABEL_USERNAME']
  conf.token    = ENV['UNBABEL_TOKEN']
end

```

# Sandbox mode

If you want to help developing this library user the following ENV variable.

```shell
export UNBABEL_SANDBOX="true"
```

## Available methods

```ruby
client.language_pairs              # lists all available language pairs
client.topics                      # lists all available topics
client.tones                       # lists all available tones
client.find(uid)                   # finds a translation by unique id
client.translations                # lists all translations
client.translations(status)        # lists translations in a given status
client.request_translation(params) # requests a new translation
```

### Translation Statuses

```
'new'         - The translation has been created and is being pre-processed
'ready'       - The translation is ready to be processed in the unbabel platform.
'in_progress' - The translation is being executed
'delivered'   - The translation has already been returned to the client (either using the endpoint or query for a translation)
```

### Request Translation

You will need the following to perform a translation request

```
text (required)            - the text to be translated.
target_language (required) - the language to translate the text to.
source_language            - the language of text. If not supplemented it will be auto detected from the text.
text_format                - The format of the text to be translated [one of text,html].
target_text                - initial version of the text to be post-edited.
uid                        - A unique identifier for the job. If one is not supplied the system will provide one.
callback_url               - Once the job is done the result will be posted to this endpoint.
formality (optional)       - The tone that should be used in the translation.
instructions (optional)    - Client instructions for the translator.
topics (optional)          - List of the topics of text.
```

### Usage samples

```
irb> client.topics
=> [{"topic"=>{"name"=>"politics"}}, {"topic"=>{"name"=>"gossip"}}, {"topic"=>{"name"=>"sex & relationships"}}, {"topic"=>{"name"=>"crafts"}}, {"topic"=>{"name"=>"parenting"}}, {"topic"=>{"name"=>"startups"}}, {"topic"=>{"name"=>"tech"}}, {"topic"=>{"name"=>"sports"}}]

irb> params = {:text=>"unbabel rules!", :target_language=>"pt", :source_language=>"en"}
irb> client.request(params)
=> {"balance"=>982.0, "client"=>"davidslv", "price"=>6.0, "source_language"=>"en", "status"=>"new", "target_language"=>"pt", "text"=>"unbabel rules!", "text_format"=>"text", "uid"=>"dbd3fea5b5"}
```

## Available soon

- Ability of bulk request translations

## Contributing

1. Fork it ( https://github.com/davidslv/unbabel-ruby-wrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
