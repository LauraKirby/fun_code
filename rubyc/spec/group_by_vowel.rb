require '_spec_helper'

describe "#group_by_vowel" do
  it "returns a hash where the vowels are the keys and the values are the words that contain the specific vowel" do
    input = ["hot"]
    expect(group_by_vowel(input)).to eq ({"o" => ["hot"]})
  end

  it "does not add the same word to a specific vowel" do
    input = ["chara"]
    expect(group_by_vowel(input)).to eq ({"a" => ["chara"]})
  end

  it "does not add the same word to a specific vowel" do
    input = ["character"]
    expect(group_by_vowel(input)).to eq ({"a" => ["character"], "e" => ["character"]})
  end

  it "does not add the same word to a specific vowel" do
    input = ["hot", "cold", "warm", "every"]
    expect(group_by_vowel(input)).to eq ({ "o" => ["hot", "cold"], "a" => ["warm"], "e" => ["every"], "y" => ["every"]})
  end
end