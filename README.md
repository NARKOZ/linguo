# Linguo

Linguo detects the language of a given text using [Free Language Detection API](http://detectlanguage.com).

[![Build Status](https://travis-ci.org/NARKOZ/linguo.png)](http://travis-ci.org/NARKOZ/linguo)

## Installation

Install it from rubygems:

```sh
gem install linguo
```

If you're using Rails, add to your Gemfile:

```ruby
gem 'linguo'
# gem 'linguo', :git => 'git://github.com/NARKOZ/linguo.git'
```

and run:

```sh
bundle
```

You can run `rails g linguo:config` to generate an initializer and set up API key at `config/initializers/linguo.rb`.

## Usage examples

You can use demo API key (`demo`) to test out any examples below.

There are a few ways to set an API key. You can set default API key globally in `Linguo::Config.api_key`:

```ruby
Linguo.api_key = "your_api_key"
```

or set the environment variable `'LINGUO_API_KEY'` and Linguo will use it.

You can also pass it directly:

```ruby
Linguo.detect("your text to detect", "your_api_key")
```

Identify text language and get confidence scores using the `detect` method:

```ruby
Linguo.detect("こんにちは")
```

Get a list of languages with confidence greater than 0.3:

```ruby
Linguo.detect("こんにちは").detections.map {|x| x['language'] if x['confidence'] > 0.3}.compact
```

Linguo adds `lang` method to `String` class:

```ruby
"こんにちは".lang
```

It will return an array containing detected languages.

For more information, refer to [documentation](http://rubydoc.info/gems/linguo/frames).

## License

Released under the BSD 2-clause license. See LICENSE.txt for details.
