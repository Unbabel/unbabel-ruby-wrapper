# Unbabel Ruby Wrapper


# Configuration

```ruby

client = Unbabel::Client.new do |conf|
  conf.username = ENV['UNBABEL_USERNAME']
  conf.token    = ENV['UNBABEL_TOKEN']
end

```

# Usage

### Request Topics

```ruby

client.topics

```


# Methods soon available

```ruby
client.topics
client.tones
client.language_pairs
client.translations           # lists listranstions
client.translations.find(uid) # queries a translation
client.translations.new()     # request new translation
```
