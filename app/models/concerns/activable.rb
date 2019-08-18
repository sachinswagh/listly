# frozen_string_literal: true

module Activable
  extend ActiveSupport::Concern

  # Models need to override this method if that model has different column name for status.
  def status_column
    :active
  end

  def activate(with: nil)
    update_attributes(status_column => true)
    return if with.blank?

    send(with).update_all(status_column => true)
  end
end
