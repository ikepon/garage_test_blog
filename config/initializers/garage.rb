Garage.configure {}
Garage::TokenScope.configure do
  register :public, desc: 'acessing publicly available data' do
    access :read, User
    access :write, User
  end
end

Garage.configuration.strategy = Garage::Strategy::Doorkeeper

Doorkeeper.configure do
  orm :active_record
  default_scopes :public
  optional_scopes(*Garage::TokenScope.optional_scopes)

  resource_owner_from_credentials do |routes|
    User.find_by(email: params[:username])
  end
end

# "error":"unsupported_grant_type" への対応
# cf. http://www.amelt.net/imc/programming/rails/4937/#8221unsupported_grant_type8221
Doorkeeper.configuration.token_grant_types << 'password'
