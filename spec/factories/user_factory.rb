FactoryBot.define do
  ud = Faker::Omniauth.unique.google
  password = Faker::Internet.password
  factory :user do
    sequence :email do |n|
      "#{n}#{ud[:info][:email].gsub(/@(.*)/i,'@gmail.com')}"
    end

    name                   {ud[:info][:name]}
    avatar                 {Faker::Avatar.image}
    provider               {ud[:provider]}
    uid                    {ud[:uid]}
    token                  {ud[:credentials][:token]}
    password               {password}
    password_confirmation  {password}
    expires_at             {Faker::Time.unique.forward.utc}
    created_at             {Faker::Time.unique.forward.utc}
    updated_at             {Faker::Time.unique.forward.utc}
  end
end
