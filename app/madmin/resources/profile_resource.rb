class ProfileResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :name
  attribute :about
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :slug
  attribute :email
  attribute :address
  attribute :min_cost
  attribute :max_cost
  attribute :phone
  attribute :image, index: false

  # Associations
  attribute :user
  attribute :artisan
  attribute :messages

  # Uncomment this to customize the display name of records in the admin area.
  # def self.display_name(record)
  #   record.name
  # end

  # Uncomment this to customize the default sort column and direction.
  # def self.default_sort_column
  #   "created_at"
  # end
  #
  # def self.default_sort_direction
  #   "desc"
  # end
end
