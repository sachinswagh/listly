# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  name        :string           default("")
#  description :text             default("")
#  active      :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# List model.
class List < ApplicationRecord
  include Deactivable
  include Activable

  # Associations
  has_many :list_items, dependent: :destroy

  # Validations
  validates :name, presence: true

  # Nested Attributes
  accepts_nested_attributes_for :list_items, allow_destroy: true

  # Scopes
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  # Instance methods
  def inactive?
    !active?
  end

  def status
    active? ? 'activated' : 'deactivated'
  end

  class << self
    def deactivate_all(collection)
      collection.update_all(new.status_column => false)
    end
  end
end
