# Opswatch [![Gem Version](https://badge.fury.io/rb/opswatch.svg)](https://badge.fury.io/rb/opswatch) [![CircleCI](https://circleci.com/gh/gianlucarizzo/opswatch.svg?style=svg)](https://circleci.com/gh/gianlucarizzo/opswatch)

Version 0.1.0 (first release)

OpsWatch lets you track your AWS OpsWorks stacks status in real time on your traybar with a single glance.
Easy to configure and to use. This first version has nothing fancy, but new features and ideas are welcome!

## Installation

To install simply use
```
gem install opswatch
```

## Usage

First run will ask you to input Amazon AWS stack information:
```
opswatch
- Let's set things up
- Stack Name (can be anything):
Production
- Region (e.g. eu-central-1):
eu-central-1
- IAM User key:
XXXXXXXXX
- IAM User secret:
XXXXXXXXX
- OpsWorks Stack ID:
id1234567
- Insert other Stack? (Y/n)
n
```
a file `.opswatch.yml` in your `$HOME` path will be created to store your configuration, and the traybar will be shown on your UI.

After this, you need to simply run
```
opswatch
```
again to use the last settings.

If you want to start from scratch you can just delete the `.opswatch.yml` file from your `$HOME` path.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gianlucarizzo/opswatch. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Opswatch project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/opswatch/blob/master/CODE_OF_CONDUCT.md).
