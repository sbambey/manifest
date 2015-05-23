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
#

FactoryGirl.define do
  factory :mission do
    title "MyText"
launch_date "2015-05-21 22:41:29"
body "MyText"
  end

end
