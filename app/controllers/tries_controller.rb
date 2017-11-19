class TriesController < ApplicationController
  # Assigning initial values to the result values
  def index
    @each_frames_score = []
    @result = nil
  end
  # A method to create objects for frame and it's children table try
  def new
    if params[:clear].eql?("true")
      Try.destroy_all
      @frame = Frame.find_by_id(params[:frame_id])
      @try = @frame.build_try
    end
  end
  # Method which create score for each tries of a frame and will store in the database
  def create
  	@try = Try.create!(try_params)
    frame_id = params[:try][:frame_id].to_i
    if frame_id < 10 # If the frame number is less than 10, then object creation has to be done by default
      object_creation(params[:try][:frame_id])
      render :new    
    elsif (frame_id == 10 || frame_id == 11) # If the frame is either 10 or 11, then it has to create object based on either strike or spare or none.
      if (frame_id == 10 && (params[:try][:try_1].to_i + params[:try][:try_2].to_i) == 10)
        object_creation(frame_id)
        render :new
      else # Here a method calculate_score will be called if all the frame values are entered and the result will be rendered on the index page.
          @each_frames_score, @final_total = Try.calculate_score
          render :index #, :locals => {:result=>final_total,:each_frames_score=>each_frames_score}
      end
    end
  end

  private
  def try_params
  	params.require(:try).permit(:try_1,:try_2,:frame_id)
  end

  def object_creation(frame_id)
    @frame = Frame.find_by_id(frame_id).next
    @try = @frame.build_try
  end
end