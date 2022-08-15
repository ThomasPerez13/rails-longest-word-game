require 'json'
require 'open-uri'

class GamesController < ApplicationController

  def new
    # action will be used to display a new random grid and a form
    @letters = (0...10).map { ('A'..'Z').to_a[rand(26)] }
  end

  def score
    @word = params[:word]
    @letters = params[:letters]
    #  form will be submitted (with POST) to the score action --> hidden field tag
    if include?(@word, @letters) == true
      english_word?(@word) == true 
      @answer = 'Well Done'
    else
      @answer = 'You suck'
    end

    # parse API
    # conditions
  end

  def include?(word, letters)
    word.split.all? do |letter|
      letters.include?(letter)
    end
  end

  def english_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    dictionary_english = URI.open(url).read
    english_word = JSON.parse(dictionary_english)
  end
end
