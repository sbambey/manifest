# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :character varyin default(""), not null
#  encrypted_password     :character varyin default(""), not null
#  reset_password_token   :character varyin
#  reset_password_sent_at :timestamp withou
#  remember_created_at    :timestamp withou
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :timestamp withou
#  last_sign_in_at        :timestamp withou
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :timestamp withou
#  updated_at             :timestamp withou
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryGirl.define do
  factory :user do
    
  end

end
