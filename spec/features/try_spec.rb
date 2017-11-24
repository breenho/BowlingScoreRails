require 'rails_helper'

RSpec.describe "Enter to game", :type => :feature, :js => true do
	#Reference
	# before { :clear => true, :frame_id => 1 }
	# within("body") do
	#   fill_in 'Name', with: 'John'
	#   fill_in 'Email', with: 'user@example.com'
	#   fill_in 'Password', with: 'password'
	#   fill_in 'Retype Password', with: 'password'
	# end
	# click_button "Let's Enter to the game"
	# expect(page).to have_content 'Frame 1'
	# expect(page).to have_content 'John'
	# page.find("body").click
	# page.find('#try_try_1').trigger('blur')


	it "allows a user to enter to new game" do
		visit root_path
		expect(page).to have_content "Welcome to Strike! A Bowling Point Let's Enter to the game"
		click_link("Let's Enter to the game")		
	end

	it "allows a user to enter Spare on Frame 1" do
		visit new_try_path(:clear=>true, :frame_id=>1)
		expect(page).to have_content "Frame 1"
		within("body") do
			fill_in 'try_try_1', with: '5'
		end		
		page.execute_script('$("#try_try_1").trigger("blur")')
		expect(page).to have_content "5 pins left"
		within("body") do
			fill_in 'try_try_2', with: '5'
		end
		page.execute_script('$("#try_try_2").trigger("blur")')
		expect(page).to have_content "Wow..!! It was a spare"
		click_button "Submit"
	end

	it "allows a user to enter Strike on Frame 2" do
		expect(page).to have_content "Frame 2"
		within("body") do
			fill_in 'try_try_1', with: '10'
		end
		page.execute_script('$("#try_try_1").trigger("blur")')
		expect(page).to have_content "Wow..!! It was a strike"
		click_button "Submit"
	end
end