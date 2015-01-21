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
client.language_pairs           # lists available language pairs
client.topics                   # lists available topics
client.tones                    # lists available tones
client.translations             # lists translations
client.translations.find(uid)   # finds a translation by unique id
client.translations.request     # requests a new translation
```

## Available soon

- Ability of bulk request translations

## Contributing

1. Fork it ( https://github.com/davidslv/unbabel-ruby-wrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
