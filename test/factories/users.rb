FactoryGirl.define do
	factory :user do
		name "anon user"
  	email "whatever@whatever.com"
  	salt "asdasdastr4325234324sdfds"
  	crypted_password Sorcery::CryptoProviders::BCrypt.encrypt("secret", salt)
  	activation_state "active"
	end
end