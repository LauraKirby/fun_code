require '_spec_helper'

describe "rotate words in an array by 13" do
  describe "#is_lowercase?" do
    it "returns true when a number is between 97 and 122" do
      lowerbound = 97
      upperbound = 122

      expect(is_lowercase?(lowerbound)).to eq(true)
      expect(is_lowercase?(upperbound)).to eq(true)
    end

    it "returns false when a number is not between 96 and 122" do
      lowerbound = 96
      upperbound = 123

      expect(is_lowercase?(lowerbound)).to eq(false)
      expect(is_lowercase?(upperbound)).to eq(false)
    end
  end

  describe "#calculate_lowercase_rotation" do
    it "returns the character + 13 for numbers between 64 & 77" do
      lowerbound = "a".ord

      expect(calculate_lowercase_rotation(lowerbound)).to match("n")
    end

    it "returns the character + 13 for numbers between 88 & 91" do
      upperbound = "z".ord

      expect(calculate_lowercase_rotation(upperbound)).to match("m")
    end
  end

  describe "#is_uppercase?" do
    it "returns true when a number is between 65 and 90" do
      lowerbound = 65
      upperbound = 90

      expect(is_uppercase?(lowerbound)).to eq(true)
      expect(is_uppercase?(upperbound)).to eq(true)
    end

    it "returns false when a number is not between 64 and 91" do
      lowerbound = 64
      upperbound = 91

      expect(is_uppercase?(lowerbound)).to eq(false)
      expect(is_uppercase?(upperbound)).to eq(false)
    end
  end

  describe "#calculate_uppercase_rotation" do
    it "returns the character + 13 for numbers between 64 & 77" do
      lowerbound = "A".ord

      expect(calculate_uppercase_rotation(lowerbound)).to match("N")
    end

    it "returns the character + 13 for numbers between 88 & 91" do
      upperbound = "Z".ord

      expect(calculate_uppercase_rotation(upperbound)).to match("M")
    end
  end


  describe "#rotate_letters" do
    it "returns a word completely rotated" do
      unrotated = "Jul"

      rotated = rotate_letters(unrotated)

      expect(rotated).to match("Why")
    end
  end


  describe "#rot13" do
    # returning the correct case is not required but it should be
    describe "uppercase letters" do
      it "returns the character + 13 for numbers between 64 & 77" do
        lowerbound = "A".ord

        expect(calculate_uppercase_rotation(lowerbound)).to match("N")
      end

      it "returns the character + 13 for numbers between 88 & 91" do
        upperbound = "Z".ord

        expect(calculate_uppercase_rotation(upperbound)).to match("M")
      end
    end

    describe "lowercase letters" do
      it "returns the character + 13 for numbers between 64 & 77" do
        lowerbound = "a".ord

        expect(calculate_lowercase_rotation(lowerbound)).to match("n")
      end

      it "returns the character + 13 for numbers between 88 & 91" do
        upperbound = "z".ord

        expect(calculate_lowercase_rotation(upperbound)).to match("m")
      end
    end

    it "returns characters that are not part of the English alphabet in their original form" do
      unrotated = ["?"]

      rotated_13 = rot13(unrotated)

      expect(rotated_13).to match(["?"])
    end

    it "returns words rotated by 13 places" do
      unrotated = ["Jul", "qvq", "gur", "puvpxra", "pebff", "gur", "ebnq"]

      rotated_13 = rot13(unrotated)

      expect(rotated_13).to match(["Why", "did", "the", "chicken", "cross", "the", "road"])
    end

    it "returns rotated characters back to their original form" do
      unrotated = ["Jul", "qvq", "gur", "puvpxra", "pebff", "gur", "ebnq"]

      rotated_form = rot13(unrotated)
      orginial_form = rot13(rotated_form)

      expect(unrotated).to match(orginial_form)
    end
  end
end

