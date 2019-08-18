# == Schema Information
#
# Table name: list_items
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :boolean
#  list_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# ListItem model
class ListItem < ApplicationRecord
  include Deactivable
  include Activable

  # Associations
  belongs_to :list

  # Validations
  validates :name, presence: true

  # Scopes
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  # Instance methods
  def inactive?
    !active?
  end
end
