require 'bike'

describe Bike do

	it 'should not be broken after being made' do
		the_bike = Bike.new
		expect(the_bike).not_to be_broken
	end

	it 'should be able to break' do
		bike = Bike.new
		bike.break!
		expect(bike).to be_broken
	end
end