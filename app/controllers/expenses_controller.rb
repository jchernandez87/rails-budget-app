class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @expenses = Group.find(params[:group_id]).expenses
  end

  def show; end

  def new
    @expense = Expense.new
    @groups = Group.where(author_id: current_user.id)
  end

  def create
    @expense = Expense.new
    @expense.name = params[:expense][:name]
    @expense.amount = params[:expense][:amount]
    @expense.author_id = current_user.id
    categories = params[:groups]
    if @expense.save
      categories.each do |category|
        ExpensesGroup.create(expense_id: @expense.id, group_id: category)
      end
      flash[:notice] = 'Transaction created successfully'
      redirect_to group_expenses_path(params[:group_id])
    end
  end
end
