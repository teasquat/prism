def load_style(path)
  "static/css/#{path}"
end

def load_script(path)
  "static/js/#{path}"
end

def load_asset(path)
  "static/assets/#{path}"
end

def load_index
  render "views/index.ecr"
end
