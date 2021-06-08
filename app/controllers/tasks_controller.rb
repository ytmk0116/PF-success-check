class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks　#全てのコントローラーから利用できる
    #データベースに保存されている全てのタスクデータを取得
  end

  def show
    @task = current_user.tasks.find(params[:id])
    #findメソッドでレコードをデータベースから検索
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))
    #検証エラーに対応させるためにTaskオブジェクトを@taskに代入させる

    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    #flash[:notice] を使うのと同じ意味
    else
      render :new　#結果がfalseだった時に登録画面を再び表示させる
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    task = current_user.tasks.find(params[:id])
    task.update!(task_params) #update!メソッドでtaskパラメーターの代入とデータベースへの保存の両方を担っている
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    task = 
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
