# require modules here
require "yaml"
require "pry"

def load_library(path)
  emoticons = YAML.load_file(path)
  result_hash = 
  {:get_meaning => {}, 
  :get_emoticon => {} }

  emoticons.each do |key, value|
    result_hash[:get_emoticon][value[0]] = emoticons[key][1]
    result_hash[:get_meaning][value[1]] = key
  end
  result_hash
end

def get_japanese_emoticon(file, emoticon)
# western emoticon => j emoticon
  file = load_library(file)
  file[:get_emoticon][emoticon] ? file[:get_emoticon][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  # japanese => english meaning
  file = load_library(file)
  file[:get_meaning][emoticon] ? file[:get_meaning][emoticon] : "Sorry, that emoticon was not found"
end