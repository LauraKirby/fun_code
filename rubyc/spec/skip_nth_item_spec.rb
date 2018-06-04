require '_spec_helper'

describe "#skip_animals" do
  it "should skip 0 - nth items in a list (not the nth index)" do
    list = ['fox', 'cow', 'zebra', 'tiger']

    skip_2 = skip_animals(list, 2)

    expect(skip_2).to match(['3:zebra', '4:tiger'])
  end
end
