require 'rails_helper'

describe ListItem do
  let(:list) { FactoryBot.create(:list) }
  let(:list_item) { FactoryBot.create(:list_item, list: list) }

  describe '#inactive?' do
    it 'returns true if list_item is inactive' do
      list_item.update(active: false)
      expect(list_item.inactive?).to eq(true)
    end
  end

  describe '#active?' do
    it 'returns true if list_item is active' do
      expect(list_item.active?).to eq(true)
    end
  end

  describe '#deactivate' do
    it 'deactivates the list_item' do
      list_item.deactivate
      expect(list_item.active).to eq(false)
    end
  end

  describe '#activate' do
    it 'activates the list_item' do
      list_item.update(active: false)
      list_item.activate
      expect(list_item.active).to eq(true)
    end
  end
end
