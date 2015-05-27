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

require 'rails_helper'

RSpec.describe Mission, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
