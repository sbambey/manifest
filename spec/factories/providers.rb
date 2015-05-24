# == Schema Information
#
# Table name: providers
#
#  id                  :integer          not null, primary key
#  name                :text
#  website             :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  logo_file_name      :string
#  logo_content_type   :string
#  logo_file_size      :integer
#  logo_updated_at     :datetime
#  banner_file_name    :string
#  banner_content_type :string
#  banner_file_size    :integer
#  banner_updated_at   :datetime
#  slug                :string
#

FactoryGirl.define do
  factory :provider do
    name "MyText"
website "MyText"
  end

end
