require 'rails_helper'

RSpec.describe "searches/show", type: :view do
  before(:each) do
    @search = assign(:search, Search.create!(languages: ['Ruby']))
  end

  it "renders attributes in bootstrap cards" do
    render
  end
end
