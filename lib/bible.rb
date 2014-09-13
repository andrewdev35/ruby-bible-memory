require 'httparty'

class Bible
  include HTTParty
  base_uri 'http://dbt.io/'

  def book_list
    response = self.class.get("/library/bookorder", query: standard_params)
    build_response(response)
  end

  def verse(book=nil, chapter=nil, verse=nil) 
    response = self.class.get("/text/verse", query: standard_params.merge({
                                      book_id: book,
                                      chapter_id: chapter,
                                      verse_start: verse}) )    
    response = build_response(response)
    response.first['verse_text']
  end


  private 

  # TODO: convert keys to symbols, for now strings is fine
  def build_response(response) 
    response.parsed_response
  end

  # TODO: Make into config block
  def standard_params
    { key: ENV["BIBLE_API_KEY"],
      v: "2",
      dam_id: "ENGESVO2ET" }
  end

end
