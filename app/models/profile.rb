class Profile < ApplicationRecord
    validates :about, length: { minimum: 30 }
    validates :artisan_id, :name, :image, :email, :phone, :min_cost, :max_cost, :address, presence: true
    belongs_to :user
    belongs_to :artisan

    has_many :messages, dependent: :destroy

    has_one_attached :image

    # extend FriendlyId
    # friendly_id :name, use: :slugged
end
