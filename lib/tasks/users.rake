# frozen_string_literal: true

namespace :users do
  desc "Create test users"
  task :create_users, [:quantity] => :environment do |_, args|
    return if Rails.env.production?
    quantity = args[:quantity].to_i
    quantity.times do
      User.create(
        role: "user",
        email: FFaker::Internet.email,
        password: "password",
        password_confirmation: "password",
      )
    end
    puts "Created #{quantity} users"
  end
end
