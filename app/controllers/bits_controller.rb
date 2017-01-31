class BitsController < ApplicationController

  def index
    @bits = Bit.all
  end

  def show
    @bit = Bit.find(params[:id])
  end

  def new
    @bit = Bit.new
    @bit.lender_id = current_user
  end

  def create
    @bit = Bit.new(bit_params)
    @bit.lender = current_user
    if @bit.save
      flash[:notice] =  "Bit Added!"
      redirect_to bits_path
    else
      flash.now[:notice] = @bit.errors.full_messages
      render :new
    end
  end

  def edit
  @bit = Bit.find(params[:id])
    if @bit.user != current_user
      flash[:notice] =  "Only bit owner can update bit information"
      redirect_to bit_path(@bit)
    end
  end

  def update
  @bit = Bit.find(params[:id])
  if @bit.user == current_user
    flash[:notice] =  "Bit updated successfully"
    redirect_to bit_path(@bit)
  else
    flash.now[:notice] = @bit.errors.full_messages
    render :edit
  end
end

def destroy
  @bit = Bit.find(params[:id])
  if @bit.user == current_user
    @bit.destroy
    redirect_to bits_path
  else
    flash[:notice] =  "Only bit owner or Admin can delete bit"
    redirect_to bit_path(@bit)
  end
end

  private

  def bit_params
    params.require(:bit).permit(:name, :image, :body, :size, :zip_code, :lender_id  )
  end
end
