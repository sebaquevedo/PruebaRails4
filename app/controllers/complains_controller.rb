class ComplainsController < ApplicationController

	before_action :set_comment, only: [:destroy]


   def create
    @company = Company.find(params[:company_id])
    @complain = @company.complains.build(complain_params)

    respond_to do |format|
      if @complain.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        format.js
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complain
      @complain = Complain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complain_params
      params.require(:complain).permit(:description, :company_id)
    end
end
