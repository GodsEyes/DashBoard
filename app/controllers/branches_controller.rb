class BranchesController < ApplicationController
  http_basic_authenticate_with name: "root", password: "root", except: [:index, :show]

  def new
    @branch=Branch.new
  end

  def edit
    @branch = Branch.find(params[:id])
  end

  def update
    @branch=Branch.find(params[:id])

    if @branch.update(branch_params)
      redirect_to @branch
    else
      render 'edit'
    end
  end


  def create
    # render plain: params[:branche].inspect
    @branch = Branch.new(branch_params)

    if @branch.save
      redirect_to @branch
    else
      render 'new'
    end
  end

  def show
    @branch=Branch.find(params[:id])
  end

  def index
    @branch = Branch.all
  end

  def destroy
    @branch=Branch.find(params[:id])
    @branch.destroy

    redirect_to branches_path
  end

  private
  def branch_params
    params.require(:branch).permit(:name,:code,:uid)
  end


end
