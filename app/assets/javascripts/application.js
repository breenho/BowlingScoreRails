// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require_tree .

$(window).load(function(){
	$('#strike-submit').on('click',function(){
		$('#new_try').submit()
	});
});
// This is the function to validate the Try 1 text field based on either it is a strike or none.
function validate_try_1(this_obj){
	obj = $(this_obj);
	msg_obj = $('#try_1_message');
	val = obj.val();
	// This condition is to validate the number,which should be 0 to 10
	if (val.trim() != "" && val >= 0 && val<=10)
	{
		if ($("#try_frame_id").val() == 11) // If the frame number is 11, then we are checking if the bonus hit is strike or not and done it's action accordingly.
		{
			if (is_strike())
			{
				obj.hide();
				msg_obj.html("Wow..!! It was a strike again. You have one more chance");
				$('#try_try_2').show();
			}
			else
			{
				enable_submit($('#strike-submit'))
			}
		}	
		else // If the frame is not the bonus frame, then we are checking if the hit is strike or not and done it's action accordingly.
		{
			if (is_strike())
			{
				msg_obj.html("Wow..!! It was a strike");
				enable_submit($('#strike-submit'))
			}
			else if(val < 10 && val >= 0) // Execute the following code if the it is not a strike
			{
				obj.hide();
				msg_obj.hide();
				$('#try_try_2').show();
				$('#try_try_2').select();
				$('#try_2_message').html(diff_of_try()+" pins left");
			}
			else
			{
				msg_obj.html("Please enter a value between 0 and 10");
			}
		}
	}
	else
	{
		msg_obj.html("Please enter only digits between 0 and 10");
	}	
}
// This is the function to validate the Try 2 text field based on either it is a spare or none.
function validate_try_2(this_obj){
	obj = $(this_obj);
	msg_obj = $('#try_2_message');
	val = obj.val();
	// This condition is to validate the number,which should be 0 to 10
	if (val.trim() != "" && val >= 0 && val <= 10)
	{
		if (is_spare()) // If it is spare, the showing the msg and submit button to submit the values
		{
			msg_obj.html("Wow..!! It was a spare");
			enable_submit($('#strike-submit'))
		}
		// Need condition here for bonus hit
		else if ($("#try_frame_id").val() == 11) // if the frame is a bonus one, and we are showing submit button to submit
		{
			enable_submit($('#strike-submit'))
			msg_obj.hide();
		}
		else // If it is not the bonus frame and the values are not spare, then submit the values to the database normally
		{
			if(val < diff_of_try() && val >= 0)
			{
				
				enable_submit($('#strike-submit'))
				msg_obj.hide();
			}
			else
			{
				msg_obj.html("Please enter a value between 0 and "+ diff_of_try());
			}
		}
	}
	else
	{
		msg_obj.html("Please enter only digits between 0 and 10");
	}
}
function is_strike(){
	return $('#try_try_1').val() == 10
}
function is_spare(){
	return sum_of_tries() == 10
}
function sum_of_tries(){
	return (parseInt($('#try_try_1').val()) + parseInt($('#try_try_2').val()));
}
function diff_of_try()
{
	return (10 - parseInt($('#try_try_1').val()));
}
function enable_submit(submit_obj)
{
	submit_obj.show();
	// submit_obj.prop('disabled', false);
}