require 'rails_helper'

RSpec.describe Post, type: :model do
  context "データが正しく保存される" do
    before do
      @post = Post.new
      @post.title = "Hello WebCamp"
      @post.content = "今日も晴れです。"
      @post.save
    end
    it "全て入力してあるので保存される" do
      expect(@post).to be_valid
    end
  end
  context "データが正しく保存されない" do
    before do
      @post = Post.new
      @post.title = ""
      @post.content = "今日も晴れです。"
      @post.save
    end
    it  "titleが入力されていないので保存されない" do
      expect(@post).to be_invalid
      expect(@post.errors[:title]).to include("can't be blank")
    end
  end
end


# describe：Postモデルをテスト対象にすることを示している。
# context ：データが正しく保存できることに関するテストであることを示している。
# before ：テスト用のデータを生成している。
# expect(@post).to：saveされているデータが入っている変数を示している。
# be_valid：@postに正しくデータが保存されているかを確認する。

# context ：データが正しく保存されないことに関するテストであることを示している。
# before ：テスト用のデータを生成している。(今回はtitleを空にしてあります。)
# be_invalid：先ほどとは逆で@postに正しくデータが保存されていないことを確認する。
# expect(@post.errors [:title])：@postに対してのエラーメッセージはerrorsに配列として入り、その中でも今回はtitleカラムを対象としている為このような記述となる。
# include("can't be blank")：'presence: true'のバリデーションをかけた場合のエラーメッセージに"can't be blank"が含まれているか確認