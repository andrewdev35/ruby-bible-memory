class Memory

  def self.each_word(text, before = "", after = "")
    text.split("\s").map { |w| "#{before}#{w}#{after}" }.join(" ")
  end

  def self.each_place_word(text, before = "", after = "")
    text = text.gsub(/\w/, "_").split("\s").map { |w| "#{before}#{w}#{after}" }.join(" ")
  end
 
  def self.shuffle_each_word(text, before="", after="")
    text.split(/\s/).shuffle.map { |w| "#{before}#{w}#{after}" }.join(" ")
  end

  def self.firsts(text)
    letters = text.split(/\s/).collect { |e| e.match(/(\w){1}/)[0] }
    letters.join(" ")
  end

  def self.verse_place(text)
    words = text.gsub(/\w/, "_").split("\s")
    output = []
    count = 1
    words.each_slice(3).each do |set|
      output.push("<span class='place' data-id='#{count}'>" << set.join("&nbsp;")<< "</span>")
      count += 1
    end
    output.join(" ")
  end

  def self.verse_pieces(text)
    words = text.split("\s")
    output = []
    count = 1
    words.each_slice(3).each do |set|
      output.push("<span class='drag' data-id='#{count}'>" << set.join("&nbsp;")<< "</span>")
      count += 1
    end
    output.shuffle.join(" ")
  end


end
