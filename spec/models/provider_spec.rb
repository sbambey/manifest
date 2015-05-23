# == Schema Information
#
# Table name: providers
#
#  id         :integer          not null, primary key
#  name       :text
#  website    :text
#  created_at :timestamp withou not null
#  updated_at :timestamp withou not null
#

require 'rails_helper'

RSpec.describe Provider, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
