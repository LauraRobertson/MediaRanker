require "test_helper"

describe Work do
  let(:work) { Work.new }
  let(:gatsby) { works(:gatsby) }

  it "must have a category" do
    work.title = "Title"

    work.valid?.must_equal false
    work.category = "Category"
    work.valid?.must_equal true
  end

  it "must have a title" do
    work.category = "Category"

    work.valid?.must_equal false
    work.title = "Title"
    work.valid?.must_equal true
  end

  it "must have a unique title" do
    work.title = "The Great Gatsby"
    work.category = "Category"
    work.valid?.must_equal false
    work.title = "The Greater Gatsby"
    work.valid?.must_equal true
  end
end
