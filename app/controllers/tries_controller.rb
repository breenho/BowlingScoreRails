class TriesController < ApplicationController
  def new
    Try.destroy_all
    @frame = Frame.first
    @try = @frame.tries.build
  end

  def create
  	p "hey"
  	@try = Try.create!(params)
  end

  private

  def params
  	params.require(:try).permit(:score)
  end
end
