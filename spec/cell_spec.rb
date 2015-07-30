require "cell"

describe Cell do

let(:water) { double :water, :material => :~}
let(:ship) { double :ship, :material => :s}
subject { Cell.new(content: water)}

	it "is water when created" do
		expect(subject.type).to eq water
	end

	it "has not been hit on initialization" do
		expect(subject).not_to be_has_been_hit
	end

	it "can change material" do
		subject.change_type(ship)
		expect(subject.type).to eq ship
	end

end
