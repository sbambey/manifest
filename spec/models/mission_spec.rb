# == Schema Information
#
# Table name: missions
#
#  id          :integer          not null, primary key
#  number      :integer
#  name        :text
#  launch_time :timestamp withou
#  teaser      :text
#  body        :text
#  coverage    :text
#  published   :boolean
#  user_id     :integer
#  provider_id :integer
#  created_at  :timestamp withou not null
#  updated_at  :timestamp withou not null
#  notes       :text
#  launch_date :date
#  net         :boolean
#

require 'rails_helper'

RSpec.describe Mission, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
