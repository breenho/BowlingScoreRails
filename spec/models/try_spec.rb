require 'rails_helper'

RSpec.describe Try, type: :model do
	it { is_expected.to belong_to :frame}

	# it "has a valid? method" do
	#   expect(Try.new).to be_valid
	# end

	# it "has a valid factory" do
	#   expect(Try.calculate_score).to be_valid
	# end
end