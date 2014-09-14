require "memory"

describe Memory do

  it "should put something before/after each word" do
    text = "In the beginning was the word."
    expect(Memory.each_word(text, "*", "*")).to eql "*In* *the* *beginning* *was* *the* *word.*"
  end

  it "should group in words of 3" do
    text = "Now there is in Jerusalem by the sheep gate a pool, which is called in Hebrew Bethesda, having five porticoes."
    words = text.split("\s")
    output = []
    words.each_slice(3).each do |set|
      output.push set.join("&nbsp;")
    end

  end 

end

