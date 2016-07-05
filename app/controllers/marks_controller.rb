class MarksController < ApplicationController
  before_action :logged_in_user
  before_action :load_mark, only: [:edit, :update]
  before_action :load_book

  def create
    @user_book = @book.marks.build marks_params
    if @user_book.save
      flash[:success] = t "userbook.create.success"
    end
    redirect_to @book
  end

  def edit
  end

  def update
    if params[:mark_type].blank?
      @user_book.mark_type = nil
    end
    if @user_book.update_attributes marks_params
      flash[:success] = t "userbook.create.success"
    end
    redirect_to @book
  end

  private
  def marks_params
    params.require(:mark).permit :user_id, :book_id, :mark_type, :favorite
  end

  def load_mark
    @user_book = Mark.find_by id: params[:id]
  end

  def load_book
    @book = Book.find_by id: params[:book_id]
  end
end
