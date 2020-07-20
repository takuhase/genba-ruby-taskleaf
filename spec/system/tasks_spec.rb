require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    # letでユーザA, ユーザBを定義
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }

    before do
      # ユーザAが呼ばれ、タスクとともにDBに保存される
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)

      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end

    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it 'ユーザAのタスクが表示される' do
        # タスク名が画面表示されていることを確認
        expect(page).to have_content '最初のタスク'
      end
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成したタスクが表示されない' do
        # ユーザーAのタスクが画面表示されないことを確認
        expect(page).not_to have_content '最初のタスク'
      end
    end
  end
end