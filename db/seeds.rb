require 'faker'

puts "Cleaning database..."
User.destroy_all
CoverLetter.destroy_all
CoverLetterEntry.destroy_all

puts "Creating users..."
5.times do |i|
  letter = ('a'..'z').to_a[i]
  user = User.new(
    email: "#{letter}@profilertest.com",
    password: '111111',
    full_name: Faker::Name.name,
    address: Faker::Address.street_address,
    phone: "+41 78#{rand(2593698..9593698)}",
    linkedin: "https://www.linkedin.com/in/fs14",
  )
  user.save!
  rand(1..3).times do
    cover_letter = CoverLetter.new(
      company: Faker::Company.name,
      is_saved: true,
      name: Faker::Name.name,
      user: user
    )
    cover_letter.save!
    rand(1..3).times do
      cover_letter_entry = CoverLetterEntry.new(
        text: Faker::Lorem.paragraph(sentence_count: 2),
        cover_letter: cover_letter
      )
      cover_letter_entry.save!
    end
  end
end

puts 'done!'
