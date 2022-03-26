class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @name = "#{Group.find(params[:group_id]).name.upcase} EXPENSES"
    @expenses = Group.find(params[:group_id]).expenses.order('created_at DESC')
    @total = Group.total(params[:group_id])
  end

  def new
    @expense = Expense.new
    @groups = Group.where(author_id: current_user.id).reject { |category| category.id == params[:group_id].to_i }
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.author_id = current_user.id
    groups = params[:groups]
    categories = params[:groups].reject { |category| category == params[:group_id] } unless groups.nil?
    if @expense.save
      ExpensesGroup.create(expense_id: @expense.id, group_id: params[:group_id])
      categories&.each do |category|
        ExpensesGroup.create(expense_id: @expense.id, group_id: category)
      end
      flash[:notice] = 'Transaction created successfully'
      redirect_to group_expenses_path(params[:group_id])
    else
      flash[:alert] = 'Transaction creation failed'
      render 'new'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
