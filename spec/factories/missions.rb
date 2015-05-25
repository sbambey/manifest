# == Schema Information
#
# Table name: missions
#
#  id                :integer          not null, primary key
#  number            :integer
#  name              :text
#  launch_time       :datetime
#  teaser            :text
#  body              :text
#  coverage          :text
#  published         :boolean
#  user_id           :integer
#  provider_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  notes             :text
#  launch_date       :date
#  net               :boolean
#  slug              :string
#  logo_file_name    :string
#  logo_content_type :string
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

FactoryGirl.define do
  factory :mission do
    title "MyText"
launch_date "2015-05-21 22:41:29"
body "MyText"
  end

end
