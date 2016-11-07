# require modules here
require "yaml"
def load_library(path)
  hashed = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(path).each do |meaning, emoticons|
    english, japanese = emoticons
    hashed["get_emoticon"][english] = japanese
    hashed["get_meaning"][japanese] = meaning
  end
  hashed
end

def get_japanese_emoticon(path, emoticon)
  list = load_library(path)
  check = list["get_emoticon"][emoticon]
  if check
    check
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  list = load_library(path)
  check = list["get_meaning"][emoticon]
  if check
    check
  else
    "Sorry, that emoticon was not found"
  end
end
