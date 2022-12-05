class DogsController < ApplicationController

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to show_profile_path(@dog.user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    redirect_to show_profile_path(@dog.user)
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to show_profile_path(@dog.user), status: :see_other
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :size, :gender, :breed, personality: [], photos: [])
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
