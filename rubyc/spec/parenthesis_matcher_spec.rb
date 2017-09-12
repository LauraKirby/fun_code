describe "#paren_matcher" do
  it "returns true with basic parentheses" do
    str = "(a)"
    expect(paren_matcher(str)).to eq true
  end

  it "returns false when final closing paren is missing" do
    str = "(a"
    expect(paren_matcher(str)).to eq false
  end

  it "returns false when first opening paren is missing" do
    str = "a)"
    expect(paren_matcher(str)).to eq false
  end

  it "returns true when multiple embedded parens are valid" do
    str = "[[(a-(b-c))], [[x,y]]]"
    expect(paren_matcher(str)).to eq true
  end

  it "returns true when multiple embedded parens are valid and one set is not" do
    str = "[[(a-(b-c))], [[x,y]]"
    expect(paren_matcher(str)).to eq false
  end

  it "returns true when multiple embedded parens are valid and one set is not" do
    str = "(((a+b))*((c-d)-(e*f))"
    expect(paren_matcher(str)).to eq false
  end
end