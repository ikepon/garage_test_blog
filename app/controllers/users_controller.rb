class UsersController < ApplicationController
  # Resource を提供する controller で include する必要がある
  include Garage::RestfulActions

  # index/create/show/update/delete それぞれに対応する require_resources/create_resource/require_resource/update_resource/destroy_resource メソッドを定義する必要がある
  def require_resources
    @resources = User.all
  end
end
