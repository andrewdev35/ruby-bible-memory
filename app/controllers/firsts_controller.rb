require 'bible'
require 'memory'

class FirstsController < ApplicationController

  def index
    @first = Memorize.new
    @books = Bible.new.book_list.map { |row| [row['book_name'], row['book_id']] }
  end

  def create
    verse = params[:memorize]
    @first = Memorize.new(verse[:book], verse[:chapter], verse[:verse])
    @firsts = Memory.firsts(@first.text)
    render :show
  end
end
