# frozen_string_literal: true

module Deactivable
  extend ActiveSupport::Concern

  # Models need to override this method if that model has different column name for status
  def status_column
    :active
  end

  def deactivate(with: nil)
    update_attributes(status_column => false)
    return if with.blank?

    send(with).update_all(status_column => false)
  end
end
