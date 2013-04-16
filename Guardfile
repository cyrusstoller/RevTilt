# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'spork', :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/routes.rb')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb')
  watch(%r{^spec/factories/.+\.rb$})
  watch('test/test_helper.rb')
  watch(%r{^spec/support/.+\.rb$})
end

guard 'rspec', :all_after_pass => false, :cli => '--drb' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }

  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  do |m|
    ["spec/routing/#{m[1]}_routing_spec.rb",
     "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
     "spec/acceptance/#{m[1]}_spec.rb",
     "spec/requests/#{m[1]}_spec.rb"]
  end
  watch(%r{^app/views/(.+)/}) do |m|
    ["spec/requests/#{m[1]}_spec.rb"]
  end
  
  # # From Rails Tutorial
  # watch(%r{^app/controllers/(.+)_(controller)\.rb$})  do |m|
  #   ["spec/routing/#{m[1]}_routing_spec.rb",
  #    "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
  #    "spec/acceptance/#{m[1]}_spec.rb",
  #    (m[1][/_pages/] ? "spec/requests/#{m[1]}_spec.rb" : 
  #                      "spec/requests/#{m[1].singularize}_pages_spec.rb")]
  # end
  # watch(%r{^app/views/(.+)/}) do |m|
  #   (m[1][/_pages/] ? "spec/requests/#{m[1]}_spec.rb" : 
  #                      "spec/requests/#{m[1].singularize}_pages_spec.rb")
  # end
  
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('spec/spec_helper.rb')                        { "spec" }
  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  # Capybara request specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }
end