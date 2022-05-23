require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @answer = params[:word]
    @letters_array = params[:letters]
    @answer_letter = @answer.split('')
    @counter = 0
    @answer_letter.each do |element|
      @counter += 1 unless @letters_array.include?(element)
    end
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
    if @counter.positive?
      @message1 = "Sorry but #{@answer} can't be built out of #{@letters_array}."
    elsif @counter = 0

    end
  end
end
