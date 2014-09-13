require 'bible'

class MemorizesController < ApplicationController

  def index
    @memorize = Memorize.new
    @books = Bible.new.book_list.map { |row| [row['book_name'], row['book_id']] }
  end

  def create
    verse = params[:memorize]
    @memorize = Memorize.new(verse[:book], verse[:chapter], verse[:verse])
    render text: @memorize.text
  end
end
