namespace :db do
  desc 'Generate some fake data'
  task bootstrap: :environment do
    print "Creating / searching users.\t\t\t"

    user = User.where(email: 'admin@example.com').first_or_create do |user|
      user.password              = 'secret123'
      user.password_confirmation = 'secret123'
    end

    user.update_column(admin: true)

    puts "#{User.count} records found / created..."
  end
end
