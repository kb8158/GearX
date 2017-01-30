class ElementsController < ApplicationController

  def index
    @elements = Element.all
  end

  def show
    @element = Element.find(params[:id])
  end

  def new
    @element = Element.new
  end

  def create
    @element = Element.new(element_params)
    @element.user = current_user
    if @element.save
      flash[:notice] =  "Element Added!"
      redirect_to elements_path
    else
      flash.now[:notice] = @element.errors.full_messages
      render :new
    end
  end

  def edit
  @element = Element.find(params[:id])
    if @element.user != current_user
      flash[:notice] =  "Only element owner can update element information"
      redirect_to element_path(@element)
    end
  end

  def update
  @element = Element.find(params[:id])
  if @element.user == current_user
    flash[:notice] =  "Element updated successfully"
    redirect_to element_path(@element)
  else
    flash.now[:notice] = @element.errors.full_messages
    render :edit
  end
end

def destroy
  @element = Element.find(params[:id])
  if @element.user == current_user
    @element.destroy
    redirect_to elements_path
  else
    flash[:notice] =  "Only element owner or Admin can delete element"
    redirect_to element_path(@element)
  end
end

  private

  def element_params
    params.require(:element).permit(:name, :image, :body, :zip_code, :size, :date, :days)
  end
end
