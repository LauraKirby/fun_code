require '_spec_helper'

describe "singlely linked node list" do
  before(:each) do
    @l_a = ListNode.new(2)

    @l_4 = ListNode.new(8); @l_3 = ListNode.new(6)
    @l_2 = ListNode.new(4); @l_1 = ListNode.new(2)

    @l_1.next = @l_2; @l_2.next = @l_3; @l_3.next = @l_4
  end

  describe "#print_node_list" do
    it "prints node value for one item list" do
      expect(print_node_list(@l_a)).to eq("2")
    end

    it "prints node values in list" do
      expect(print_node_list(@l_1)).to eq("2, 4, 6, 8")
    end
  end

  # describe "#reverse_nodes" do
  #   it "receives two empty arrays. returns zero" do
  #     expect(find_median_sorted_arrays([],[])).to eq 0
  #   end
  #   describe "list size of two" do
  #     it "switches the order" do
  #     end
  #   end
  # end

  # describe "#reverse_group_of_nodes" do
  # end
end
