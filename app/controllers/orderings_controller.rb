require 'bible'
require 'memory'

class OrderingsController < ApplicationController

  def index
    @ordering = Memorize.new
    @books = Bible.new.book_list.map { |row| [row['book_name'], row['book_id']] }
  end

  def create
    verse = params[:memorize]
    @ordering = Memorize.new(verse[:book], verse[:chapter], verse[:verse])
    @place = Memory.verse_place(@ordering.text)
    @verse = Memory.verse_pieces(@ordering.text)
    render :show
  end
end
