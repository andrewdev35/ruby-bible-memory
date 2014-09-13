require "bible"

describe Bible do

  it "should have a book list and first book is genesis" do 
    b = Bible.new
    expect(b.book_list.first['book_name']).to eql "Genesis" 
  end

end
