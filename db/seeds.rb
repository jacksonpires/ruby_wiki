print "Creating wiki detail.\t\t\t"

WikiDetail.where(name: 'Ruby Wiki').first_or_create

puts 'Done.'
