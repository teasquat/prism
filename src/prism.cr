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
    File.read load_style(env.param.query["path"])
  end

  # load scripts
  get "/script/:path" do |env|
    env.response.content_type = "application/javascript"
    File.read load_style(env.params.query["path"])
  end
end
