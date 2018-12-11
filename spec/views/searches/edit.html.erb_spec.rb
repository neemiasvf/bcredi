require 'rails_helper'

RSpec.describe "searches/edit", type: :view do
  before(:each) do
    @search = assign(:search, Search.create!())
  end
end
