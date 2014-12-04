require 'rails_helper'

describe Tool do
  # has a status of in or out
  # has an attribute of kind

  it 'is valid with a kind and status' do
    expect(Tool.new(kind: "hammer", status: "in")).to be_valid
  end

  it 'is invalid without a kind' do
    expect(Tool.new(status: "in")).to_not be_valid
  end

  it 'is invalid without a status' do
    expect(Tool.new(kind: "wheelbarrow")).to_not be_valid
  end

  it 'is invalid if status is not "in" or "out"' do
    expect(Tool.new(kind: "shovel", status: "cookie")).to_not be_valid
  end

end
