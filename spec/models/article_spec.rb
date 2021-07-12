# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
require "rails_helper"

RSpec.describe Article, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "タイトルが入力された時" do
    it "記事が作成される" do
      expect(build(:article)).to be_valid
    end
  end

  context "タイトルがない時" do
    it "記事が作られない" do
      article = build(:article, title: nil)
      expect(article).to be_invalid
      expect(article.errors.details[:title][0][:error]).to eq :blank
    end
  end
end
