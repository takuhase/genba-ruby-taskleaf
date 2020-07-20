require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      # ユーザA作成
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      # ユーザAのタスク作成
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
    end

    context 'ユーザーがログインしているとき' do
      before do
        # ユーザAでログイン
        visit login_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザAのタスクが表示される' do
        # タスク名が画面表示されていることを確認
        expect(page).to have_content '最初のタスク'
      end
    end
  end
end