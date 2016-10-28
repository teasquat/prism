require "./prism/*"

require "kemal"

module Prism
  # load index
  get "/" do
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

  # load assets
  get "/assets/:path" do |env|
    File.read load_asset(env.params.url["path"])
  end

  Kemal.run
end
