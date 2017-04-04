require 'spec_helper'

  describe "#two_sum" do

      it "returns the index for the values that add up to the given sum" do
        expect(two_sum([2,2],4)).to match_array([0,1])
      end

      it "returns the index for the given sum" do
        expect(two_sum([2,3,2],4)).to match_array([0,2])
      end
  end
