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
    redirect_to '/top'
  end

  def index # データの内容・一覧を表示する
   @lists = List.all
  end

  def show #データの詳細を表示する
  end

  def edit #データを更新するためのフォームを表示する
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
