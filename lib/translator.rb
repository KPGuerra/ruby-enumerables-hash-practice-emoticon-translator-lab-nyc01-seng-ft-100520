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
  emoticons.each do |meaning, language|
    if language[:english] == emoticon
      result = language[:japanese]
    else
      result = "Sorry, that emoticon was not found"
    end 
  end
end

def get_english_meaning (emoticon_file, emoticon)
  # code goes here
  emoticons = load_library(emoticon_file)
  result = "Sorry, that emoticon was not found"
  emoticons.find do |meaning, language|
    language.find do |inner_key, emote|
      if emote == emoticon
        result = emoticons.key(emoticon)
      end 
    end 
  end
  result
end