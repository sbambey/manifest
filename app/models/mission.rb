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
#  launch_location   :text
#  edit_history      :text             default("")
#

class Mission < ActiveRecord::Base
	extend FriendlyId

	friendly_id :slug_candidates, use: [:slugged, :history]

	serialize :edit_history, Array

	belongs_to :provider
	belongs_to :user

	scope :published, -> { where(published: true) }

	scope :upcoming, -> { where("launch_time IS NULL OR launch_date > ? OR (launch_time >= ? AND launch_date <= ?)", Date.today, Time.zone.now-LAUNCH_CUTOFF, Date.today) }
	scope :completed, -> { where("launch_time IS NOT NULL AND launch_time < ? AND launch_date <= ?", Time.zone.now-LAUNCH_CUTOFF, Date.today) }

	has_attached_file :logo, styles: {
		thumb: '200x',
    small: '300x200>'
  }
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

	#true when rocket has lifted off
	def launched?
		!launch_time.nil? && launch_time < Time.zone.now && launch_date <= Date.today
	end

	#true LAUNCH_CUTOFF hours after liftoff
	def outside_launch_window?
		!launch_time.nil? && launch_time < (Time.zone.now-LAUNCH_CUTOFF) && launch_date <= Date.today
	end

	def should_generate_new_friendly_id?
  	true
  end

  def slug_candidates
  	[
  		[:name],
  		[:name, :number]
  	]
  end

	private 

	LAUNCH_CUTOFF = 2.hours
	
end
