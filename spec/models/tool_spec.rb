require 'rails_helper'

describe Tool do
  # has a status of in or out
  # has an attribute of kind

  describe 'validations' do

    it 'is valid with a kind and status' do
      expect(Tool.new(name: "hammer", status: "in")).to be_valid
    end

    it 'is invalid without a kind' do
      expect(Tool.new(status: "in")).to_not be_valid
    end

    it 'is invalid without a status' do
      expect(Tool.new(name: "wheelbarrow")).to_not be_valid
    end

    it 'is invalid if status is not "in" or "out"' do
      expect(Tool.new(name: "shovel", status: "cookie")).to_not be_valid
    end

  end

  describe '#set_user_id' do
    it 'updates user_id to nil when tool is returned' do
      user = User.create
      tool = Tool.create(name: "shovel", status: "out")
      tool.set_user_id(user.id)
      expect(Tool.find(tool.id).user_id).to eq user.id
    end
  end
  # when a user clicks "check me out", the status changes to "out" and the "user_id" is set



end
