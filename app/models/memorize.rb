class Memorize
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :book, :chapter, :verse, :text 

  def initialize(book=nil, chapter=nil, verse=nil)
    @book = book
    @chapter = chapter
    @verse = verse 
    lookup unless book.nil?
  end 

  def persisted?
    false
  end

  def lookup
    @text ||= Bible.new.verse(@book, @chapter, @verse)
  end
end
