# RevTilt [![Build Status](https://travis-ci.org/cyrusstoller/RevTilt.png)](https://travis-ci.org/cyrusstoller/RevTilt)

## Goal

This is a platform to collect information and reviews about whether businesses are accommodating of customers with special needs.

Here is a scenario where this sort of information might be useful:
Imagine you are a parent of a child who is on the autism spectrum and that you are out of town visiting relatives.
Your child has cut his/her own hair and you need to find a barber to give your child a haircut. 
Searching Yelp for good salons or barber shops won't give you sufficient information.
You want to find a barber who will be accommodating of your child's special needs.

This is where *RevTilt* comes in.

As a parent you can easily find businesses that are autism-friendly. 
*RevTilt* is a platform to share and find reviews specific to your family member's special needs. 
These reviews are provided along side existing _mainstream_ reviews on sites like Yelp.

For now this project is devoted entirely to autism, but our goal is to accommodate other special needs as well.

## Contributing

### Bugs / Issues

If you find a bug or something that could improve the user experience, please file an issue on this github project,
so our contributors/maintainers can get started fixing them. :-)

Even if you plan on filing a patch for the issue yourself it'd be great if you could still file an issue so that we
don't have people duplicating work unnecessarily.

### Submitting Pull Requests

1. Fork this project
2. Make a feature branch `git checkout -b feature`
3. Make your changes and commit them to your feature branch
4. Submit a pull request

## Where did this all get started?

*RevTilt* (then called Puzzled) won first place at the [AT&T Hackathon on Hacking Autism](https://mobileappassf-eorg.eventbrite.com/) in April 2013.

### Press

So far there have been stories about RevTilt written by the LA Times, CNN, and SFGate. 
Click [here](http://www.revtilt.com/press) for a complete list.

# Getting you development environment setup

You will need to create a `.env` file in the `RevTilt` directory. You should have the following variables defined.
```
SECRET_TOKEN=*SOME HEX STRING*
DEVISE_SECRET_TOKEN=*A DIFFERENT HEX STRING*
admin_user=cyrus
admin_password=p455w0rd
SMTP_DEV_EMAIL=*where all development emails should be sent*
SMTP_ADDRESS=smtp.gmail.com
SMTP_DOMAIN=gmail.com
SMTP_USERNAME=*sending gmail address*
SMTP_PASSWORD=*sending gmail password*
BING_MAPS_API_KEY=*key from the bingmpasportal*
NEWRELIC_LICENSE_KEY=*key from new relic*
```

add these variables to Heroku with `heroku config:add`.

## API Keys

- Bing Maps API: https://www.bingmapsportal.com/application/
- New Relic API: http://newrelic.com/

## Install gems and setup your database

```
$ bundle install
$ rake db:create # first time only
$ rake db:migrate # whenever you update the database schema
$ rake db:test:prepare
$ foreman start
$ bundle exec guard # to run spork and tests
```
