class Memory

  def self.each_word(text, before = "", after = "")
    text.split("\s").map { |w| "#{before}#{w}#{after}" }.join(" ")
  end

  def self.each_place_word(text, before = "", after = "")
    text = text.gsub(/\w/, "_").split("\s").map { |w| "#{before}#{w}#{after}" }.join(" ")
  end
 
  def self.shuffle_each_word(text, before="", after="")
    text.split("\s").shuffle.map { |w| "#{before}#{w}#{after}" }.join(" ")
  end

  def self.verse_place(text)
    words = text.gsub(/\w/, "_").split("\s")
    output = []
    words.each_slice(3).each do |set|
      output.push("<span class='place'>" << set.join("&nbsp;")<< "</span>")
    end
    output.join(" ")
  end

  def self.verse_pieces(text)
    words = text.split("\s")
    output = []
    words.each_slice(3).each do |set|
      output.push("<span class='drag'>" << set.join("&nbsp;")<< "</span>")
    end
    output.shuffle.join(" ")
  end


end
