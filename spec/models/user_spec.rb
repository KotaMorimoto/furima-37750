require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ新規登録' do
    it '必須項目を全て正しい形で埋めれば登録できる' do
      expect(@user).to be_valid
    end
    it 'ニックネームが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '重複したemailアドレスは登録できない' do
      @user.save
      user = FactoryBot.build(:user)
      user.email = @user.email
      user.valid?
      expect(user.errors.full_messages).to include 'Email has already been taken'
    end
    it '@を含まないe-mailアドレスは登録できない' do
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードが6文字以下では登録できない' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'パスワードとパスワード(確認)が一致しなければ登録できない' do
      @user.password = '123456780'
      @user.password_confirmation = '987654321'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it '名前が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it '名字が空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it '名前が全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      @user.first_name = '123abc'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid'
    end
    it '名字が全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      @user.last_name = '123abc'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name is invalid'
    end
    it '名前（カナ）が空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it '名字（カナ）が空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it '名前（カナ）が全角カナ以外では登録できない' do
      @user.first_name_kana = '123abc'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid'
    end
    it '名字（カナ）が全角カナ以外では登録できない' do
      @user.last_name_kana = '123abc'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name kana is invalid'
    end
    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
