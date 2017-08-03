require '_spec_helper'

describe "#quick_sort" do
  it 'simply returns a single-element array wihout calling partition' do
    sorted = QuickSort.new([1])
    # single_element_array = [1]
    # QuickSort.new(single_element_array).sortr!
    # expect(single_element_array).to eq(single_element_array)
  end

  it 'sorts the array in place' do
    ten_element_array = [2,5,3,1,4,5,7,0,9,2,10]
    QuickSort.new(ten_element_array).sortr!
    expect(ten_element_array).to eq([0, 1, 2, 2, 3, 4, 5, 5, 7, 9, 10])
  end

  it 'sorts a partially sorted array' do
    partially_sorted_array = [1,3,2,4,5]
    QuickSort.new(partially_sorted_array).sortr!
    expect(partially_sorted_array).to eq((1..5).to_a)
  end

  it 'sorts a fully sorted array' do
    sorted_array = [1,2,3,4,5]
    QuickSort.new(sorted_array).sortr!
    expect(sorted_array).to eq([1, 2, 3, 4, 5])
  end

  it 'sorts a single element array' do
    single_element_array = [1]
    QuickSort.new(single_element_array).sortr!
    expect(single_element_array).to eq([1])
  end
end