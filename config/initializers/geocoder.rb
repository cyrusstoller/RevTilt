Geocoder::Configuration.lookup = :bing
Geocoder::Configuration.api_key = ENV["BING_MAPS_API_KEY"]

if Rails.env.test?
  Geocoder.configure(:lookup => :test)

  Geocoder::Lookup::Test.set_default_stub(
    [
      {
        'latitude'     => 40.7143528,
        'longitude'    => -74.0059731,
        'address'      => 'New York, NY, USA',
        'state'        => 'New York',
        'state_code'   => 'NY',
        'country'      => 'United States',
        'country_code' => 'US',
        'postal_code'  => '10038'
      }
    ]
  )
end