require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば登録できること' do
        expect(@user).to be_valid
      end
      it 'nameに全角スペースがあっても登録できること' do
        @user.name = '名前　名前'
        expect(@user).to be_valid
      end
      it 'kanaに全角スペースがあっても登録できること' do
        @user.name = 'ナマエ　ナマエ'
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nameが空だとと登録できないこと' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが英字だと登録できないこと' do
        @user.name = 'namae'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end
      it 'kanaが空だと登録できないこと' do
        @user.kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana can't be blank")
      end
      it 'kanaが漢字だと登録できないこと' do
        @user.kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana is invalid")
      end
      it 'kanaがひらがなだと登録できないこと' do
        @user.kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana is invalid")
      end
      it 'kanaが英字だと登録できないこと' do
        @user.kana = 'ABC'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana is invalid")
      end
      it 'emailが空だと登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@を含まないと登録できないこと' do
        @user.email = 'emailgmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'telが空だと登録できないこと' do
        @user.tel = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telがハイフンを含んでいると登録できないこと' do
        @user.tel = '090-1111-2222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Tel is invalid")
      end
      it 'telが9桁以下だと登録できないこと' do
        @user.tel = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include("Tel is invalid")
      end
      it 'telが12桁以上だと登録できないこと' do
        @user.tel = '123456789012'
        @user.valid?
        expect(@user.errors.full_messages).to include("Tel is invalid")
      end
      it 'passwordが空だと登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは6文字以上でないと登録できないこと' do
        @user.password = '1234a'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが英字だけだと登録できないこと' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字だけだと登録できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = 'abc123'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
