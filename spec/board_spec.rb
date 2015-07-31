require "board"

describe Board do
	let(:ship){double(:ship, placed?: true, size: 3, direction: :horizontal)}
	let(:cell){double(:cell, type: :ship)}

	it "can convert coordinates" do
		expect(subject.convert_coordinates("B10")).to eq ([1,9])
	end

	it "can place a ship" do
		expect(subject).to respond_to(:place).with(3).arguments
	end

	it 'responds to display grid' do 
		expect(subject).to respond_to(:display_grid)
	end

	it "does not allow you to place a ship off the board" do
		expect{subject.place(ship, "K1", :horizontal)}.to raise_error "You cannot place ship outside grid"
	end

	# it "places ship into cell" do
	# 	subject.place(ship, "A1", :N)
	# 	expect(subject)
	# end

end
