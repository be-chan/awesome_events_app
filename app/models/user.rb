class User < ApplicationRecord
  def self.find_or_create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]

    # providerとuidで見つかった場合はどのオブジェクトを返す。見つからなかったら、新しくレコードを作成し、そのオブジェクトを返す。
    User.find_or_create_by!(provider: provider, uid: uid) do |user|
      user.name = nickname
      user.image_url = image_url
    end
  end
end
