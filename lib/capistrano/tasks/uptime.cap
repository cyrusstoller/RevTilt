desc "Report Uptimes"
task :uptime do
  on roles(:all) do |host|
    info "Host #{host} (roles: #{host.roles.map(&:to_s).join(", ")}):\t#{capture(:uptime)}"
  end
end