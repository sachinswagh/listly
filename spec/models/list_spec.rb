require 'rails_helper'

describe List do
  let(:list) { FactoryBot.create(:list) }

  describe '#inactive?' do
    it 'returns true if list is inactive' do
      list.update(active: false)
      expect(list.inactive?).to eq(true)
    end
  end

  describe '#active?' do
    it 'returns true if list is active' do
      expect(list.active?).to eq(true)
    end
  end

  describe '#deactivate' do
    it 'deactivates the list' do
      list.deactivate
      expect(list.active).to eq(false)
    end
  end

  describe '#activate' do
    it 'activates the list' do
      list.update(active: false)
      list.activate
      expect(list.active).to eq(true)
    end
  end
end
