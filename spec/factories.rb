# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Marion Herkert"
  user.email                 "mherkert@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :cookbook do |cookbook|
  cookbook.title "Foo bar"
  cookbook.description "Foo description"
  cookbook.association :user
end

Factory.define :recipe do |recipe|
  recipe.title "Recipe title"
  recipe.instructions "Recipe instructions"
  recipe.association :user
  recipe.association :cookbook
end