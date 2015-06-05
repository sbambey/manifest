# == Schema Information
#
# Table name: attachments
#
#  id                :integer          not null, primary key
#  mission_id        :integer
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  description       :text
#  source_name       :text
#  source_link       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Attachment < ActiveRecord::Base
	belongs_to :mission

	has_attached_file :file, styles: {
		thumb: 'x250',
  }

  do_not_validate_attachment_file_type :file

  ##Image

	def full
		file.url
	end

	def thumb
		file.url(:thumb)
	end

	def caption
		caption = ""
		caption << description if description.present?
		caption << "#{', ' if description.present?}Source: #{source_name}" if source_name.present?
		return caption.html_safe
	end
end
