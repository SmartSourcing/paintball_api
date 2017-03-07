require 'test_helper'

describe "Products integration" do

  before do
    @tis = Tournament.all
  end

  it "shows product's name" do

    get "api/v1/tournaments"
    product = Product.create!(name: "Tofu")
    visit product_path(product)
    page.text.must_include "Tofu"
  end
end
