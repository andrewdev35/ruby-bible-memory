require 'httparty'

class Bible
  include HTTParty
  base_uri 'http://dbt.io/'

  def book_list
    response = self.class.get("/library/bookorder", query: standard_params)
    puts response.parsed_response
  end

  def verse(book=nil, chapter=nil, verse=nil) 
    response = self.class.get("/text/verse", query: standard_params.merge({
                                      book_id: "Gen",
                                      chapter_id: "4",
                                      verse_start: "7"}) )    
    puts response.parsed_response
  end


  private 
  # TODO: Make into config block
  def standard_params
    { key: ENV["BIBLE_API_KEY"],
      v: "2",
      dam_id: "ENGESVO2ET" }
  end

end
