class BranchesController < ApplicationController
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

private
def branch_params
  params.require(:branch).permit(:name,:code,:uid)
end


end
