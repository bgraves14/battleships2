require 'ship'

describe Ship do
  it "contains material" do
  	ship = Ship.destroyer
  	expect(ship.material).to eq :s
  end

  it "ships need to be created with size" do
  	test_ship = described_class.test
    expect(test_ship.size).to be > 0
  end

  it "destroyer is size 2" do
  	destroyer = described_class.destroyer
    expect(destroyer.size).to eq 2
  end

  it "cruiser is size 3" do
  	cruiser = described_class.cruiser
    expect(cruiser.size).to eq 3
  end

  it "submarine is size 3" do
  	submarine = described_class.submarine
    expect(submarine.size).to eq 3
  end

  it "battleship is size 4" do
  	battleship = described_class.battleship
    expect(battleship.size).to eq 4
  end

  it "aircraft_carrier is size 5" do
  	aircraft_carrier = described_class.aircraft_carrier
    expect(aircraft_carrier.size).to eq 5
  end


  it "should be floating" do
  	test_ship = described_class.test
  	expect(test_ship.status).to eq :floating
  end

end
