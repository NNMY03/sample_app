class ListsController < ApplicationController
  def new #データの新規作成フォームを表示する
    # Viweへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @list = List.new
  end

  def create #データを追加・保存する
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 4. トップ画面へリダイレクト
    redirect_to list_path(list.id)
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

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
