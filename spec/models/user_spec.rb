require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
      it "passwordが半角英数であれば登録できる" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
        expect(@user).to be_valid
      end
      it "first_nameが全角であれば登録できる" do
        @user.first_name = "安倍"
        expect(@user).to be_valid
      end
      it "last_nameが全角であれば登録できる" do
        @user.last_name = "仁"
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カタカナであれば登録できる" do
        @user.first_name_kana = "アベ"
        expect(@user).to be_valid
      end
      it "last_name_kanaが全角カタカナであれば登録できる" do
        @user.last_name_kana = "ジン"
        expect(@user).to be_valid
      end

    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは@がないと登録できない" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("@ is necessary")
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "半角英数でなければ登録できない" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include(" Include both letters and numbers")
      end
      it "first_nameが全角でなければ登録できない" do
        @user.first_name = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("Full-width characters")
      end
      it "last_nameが全角でなければ登録できない" do
          @user.last_name = "zin"
          @user.valid?
          expect(@user.errors.full_messages).to include("Full-width characters")
      end
      it "first_name_kanaが全角カタカナでなければ登録できない" do
        @user.first_name_kana = "あべ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Full-width katakana characters")
      end
      it "last_name_kanaが全角カタカナでなければ登録できない" do
        @user.last_name_kana = "じん"
        @user.valid?
        expect(@user.errors.full_messages).to include("Full-width katakana characters")
      end
      it "誕生日が空だと登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth_day can't be blank")
      end

    end
  end
end
