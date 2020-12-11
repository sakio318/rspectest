require 'rails_helper'

RSpec.describe "Posts",type: :request do
  describe '新規投降ページ' do
    context "新規投稿ページが正しく表示される" do
      before do
        get posts_new_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("新規投降")
      end
    end
  end
end

# RSpec.describe "Posts"：PostsControllerをテスト対象にすることを示している。
# describe：新規投稿ページの関するテストであることを示している。
# context ：新規投稿ページの正しく表示されることに関するものをまとめる。
# before ：今回は' get posts_new_path 'で新規投稿ページを表示する処理をitの前に行う。
# response.status：この記述することでレスポンスステータスが受け取ることができる。
# eq ：表示成功した時のレスポンスステータスの' 200 'を記述している。