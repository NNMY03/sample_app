class ListsController < ApplicationController
  def new #データの新規作成フォームを表示する
    # Viweへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @list = List.new
  end

  def create #データを追加・保存する
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def index # データの内容・一覧を表示する
   @lists = List.all
  end

  def show #データの詳細を表示する
   @list = List.find(params[:id])
  end

  def edit #データを更新するためのフォームを表示する
   @list = List.find(params[:id])
  end

def update
  list = List.find(params[:id])
  list.update(list_params)
  redirect_to list_path(list.id)
end

  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to '/lists'  # 投稿一覧画面へリダイレクト  
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
