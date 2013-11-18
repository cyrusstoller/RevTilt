def template(filename)
  File.read(File.expand_path("../../templates/#{filename}", __FILE__))
end