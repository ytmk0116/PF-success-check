class TasksController < ApplicationController
  def index
    @tasks = Task.all
    #データベースに保存されている全てのタスクデータを取得
  end

  def show
    @task = Task.find(params[:id])
    #findメソッドでレコードをデータベースから検索
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
    #flash[:notice] を使うのと同じ意味
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params) #update!メソッドでtaskパラメーターの代入とデータベースへの保存の両方を担っている
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end
  
  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end
  
  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
