class Message < ApplicationRecord
  belongs_to :profile
  belongs_to :user
  belongs_to :parent, class_name: 'Message', optional: true
  has_many :messages, foreign_key: :parent_id
end