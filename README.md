# Improc

Image processing easy with OpenCV.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'improc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install improc

## Usage

Here is a list of the provided classes and their usage.
Refer to the test for more usage details.

### OpenCV Detector

A wrapper around OpenCV feature detectors and descriptors.

```ruby
detector = Improc::Detector.new 'path/to/image.jpg'
keypoints, descriptors = detector.process :orb
```

Currently only ORB is supported.

### OpenCV Storage

A wrapper around OpenCV storage facility.

```ruby
file = '/path/to/image.yml.gz'
storage = Improc::Storage.new file
# store to file
storage.store keypoints, descriptors
# load from file
kp, des = storage.load
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake test` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you
to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`, which will create a git tag for
the version, push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub
at https://github.com/dapicester/improc.

This project is intended to be a safe, welcoming space for collaboration,
and contributors are expected to adhere to the
[Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

