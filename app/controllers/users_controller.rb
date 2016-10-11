class UsersController < ApplicationController
  validates :index do
    integer :page, description: 'Parameter for pagination.'
    integer :per_page, description: 'Parameter for pagination.'
  end

  validates :update do
    string :name, required: true, description: "Arbitrary name for user. It's not restricted to be unique."
  end

  # Resource を提供する controller で include する必要がある
  include Garage::RestfulActions

  # index/create/show/update/delete それぞれに対応する require_resources/create_resource/require_resource/update_resource/destroy_resource メソッドを定義する必要がある
  def require_resources
    @resources = User.all
  end

  def require_resource
    @resource = User.find(params[:id])
  end

  def update_resource
    @resource.update_attributes!(user_params)
  end

  def user_params
    params.permit(:name)
  end

  def respond_with_resoures_options
    { paginate: true }
  end
end
