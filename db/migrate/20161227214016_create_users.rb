class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider,  null: false    # OmniAuthの認証で使用するプロバイダ名(Twitter)
      t.string :uid,       null: false    # provider毎に与えられるユーザー認識用の文字列
      t.string :nickname,  null: false    # Twitter ID
      t.string :image_url, null: false    # Twitterアイコンの画像のurl

      t.timestamps
    end

    add_index :users, [:provider, :uid], unique: true
  end
end
