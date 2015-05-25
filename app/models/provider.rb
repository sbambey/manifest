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

class Provider < ActiveRecord::Base
	extend FriendlyId

	friendly_id :name, use: [:slugged, :history]

	has_many :missions

	has_attached_file :logo, styles: {
    thumb: '200x100>',
    small: '300x',
    medium: '500x300>'
  }
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  has_attached_file :banner
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  def should_generate_new_friendly_id?
  	true
  end
end
