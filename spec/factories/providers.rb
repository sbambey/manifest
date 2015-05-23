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

FactoryGirl.define do
  factory :provider do
    name "MyText"
website "MyText"
  end

end
