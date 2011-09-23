# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :valid_user, :class => User do |user|
  user.login                  "default_user"
  user.email                  "user@example.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
  user.single_access_token    "k3cFzLIQnZ4MHRmJvJzg"
end

Factory.define :invalid_user , :class => User do |user|
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end