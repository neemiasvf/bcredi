# == Schema Information
#
# Table name: searches
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  languages  :string           is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  results    :hstore           is an Array
#

require 'rails_helper'

RSpec.describe Search, type: :model do
  it { should validate_presence_of :languages }
end
