class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @expenses = Expense.all
  end

  def show; end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new
    @expense.name = params[:expense][:name]
    @expense.amount = params[:expense][:amount]
    @expense.author_id = current_user.id
    if @expense.save
      ExpensesGroup.create(expense_id: @expense.id, group_id: params[:group_id])
      flash[:notice] = 'Transaction created successfully'
      redirect_to group_expenses_path(params[:group_id])
    end
  end
end
