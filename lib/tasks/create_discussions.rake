task create_discussions: [:environment] do

  if Discussion.count > 100
    puts "There are already more than 100 discussions "
  else
    101.times do
      status = ['active', 'closed', 'stale', 'stagnate', 'urgent'].sample
      Discussion.create(title: Faker::Lorem.words(10).join(' '), sticky:false, status: status)
    end
  end
end