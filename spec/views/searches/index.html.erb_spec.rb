require 'rails_helper'

RSpec.describe "searches/index", type: :view do
  before(:each) do
    assign(:searches, [
      Search.create!(),
      Search.create!()
    ])
  end
end
