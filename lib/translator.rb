# require modules here
require 'yaml'
require 'pry'

def load_library(emoticon_file)
  # code goes here
  file = YAML.load_file(emoticon_file)
  file.each_with_object({}) do |(key, value), hash|
    hash[key] = {:english => value[0], :japanese => value[1]}
  end 
end

def get_japanese_emoticon (emoticon_file, emoticon)
  # code goes here
  emoticons = load_library(emoticon_file)
  result = "Sorry, that emoticon was not found"
  emoticons.find do |meaning, language|
    if language[:english] == emoticon
      result = language[:japanese]
    end 
  end
  result
end

def get_english_meaning (emoticon_file, emoticon)
  # code goes here
  emoticons = load_library(emoticon_file)
  result = "Sorry, that emoticon was not found"
  emoticons.find do |meaning, language|
      if language[:japanese] == emoticon
        result = e
    end 
  end
  result
end