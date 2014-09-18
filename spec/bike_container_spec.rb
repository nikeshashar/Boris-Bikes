require './lib/bike_container' 

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	it "should accept a bike" do
		#we expect the holder to have 0 bikes
		expect(holder.bike_count).to eq(0)
		#let's dock a bike into the holder
		holder.dock(bike)
		#now we expect the holder to have 1 bike
		expect(holder.bike_count).to eq(1)
	end

	it "should accept a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq (1)
	end	

	it "should know when its full" do
		expect(holder).not_to be_full
		fill_holder holder
		expect(holder).to be_full	
	end

	it "should not accept a bike if it's full" do
		fill_holder holder
		expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
	end

	def fill_holder(holder)
  		10.times { holder.dock(bike) }
	end

	it "should provide the list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new    
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it "should provide a list of broken bikes" do
		working_bike, broken_bike = Bike.new, Bike.new    
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.broken_bikes).to eq([broken_bike])
	end

	it "should show empty when there are no bikes" do
		expect(holder).to be_empty
	end

	context "it should release a bike if" do
	
		it "should release a bike" do
			holder.dock(bike)
			holder.release(bike)
			expect(holder.bike_count).to eq(0)
		end

		it "it's there" do
			bike1 = Bike.new
			bike2 = Bike.new
			holder.dock(bike1) #putting bike 1 in the holder
			expect(holder.bikes).to eq [bike1] #expect the holder to contain bike 1
			expect{(holder.release(bike2))}.to raise_error(RuntimeError) # expect when asking for bike2 to raise error 

		end
	end
end

















