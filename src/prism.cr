require "./prism/*"

require "kemal"

module Prism
  # load index
  get "/" do
    puts "index.ecr : render"
    load_index
  end

  # load stylesheet
  get "/style/:path" do |env|
    env.response.content_type = "text/css"
    File.read load_style(env.params.url["path"])
  end

  # load scripts
  get "/script/:path" do |env|
    env.response.content_type = "application/javascript"
    File.read load_script(env.params.url["path"])
  end

  Kemal.run
end
