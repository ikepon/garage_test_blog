class User < ApplicationRecord
  include Garage::Representer # リソースのエンコーディング・シリアライゼーションを提供するモジュール
  include Garage::Authorizable # アクセスコントロール機能を提供するモジュール

  # property でリソースが持つ属性を宣言
  property :id
  property :name
  property :email

  # その他、link を用いて他のリソースへのリンクを宣言することも可

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
    perms.permits! :write if self == other
  end
end
