require 'faker' # installing faker gem, to fake user data

# Cleaning the entire database
puts "Cleaning database..."
CoverLetterEntry.destroy_all # deleting all cover letter entries
CoverLetter.destroy_all # deleting all cover letters
User.destroy_all # deleting all users

puts "Creating users..."
5.times do |i| # creating 5 users
  letter = ('a'..'z').to_a[i] # creating a letter based on index
  user = User.new(
    email: "#{letter}@profilertest.com", # using generated letter to have different email adresses
    password: '111111', # setting password to 111111 for all fake users
    full_name: Faker::Name.name, # generating a random name
    address: Faker::Address.street_address, # generating a random address
    phone: "+41 78#{rand(2593698..9593698)}", # random phone number
    linkedin: "https://www.linkedin.com/in/fs14",
  )
  user.save!
  rand(1..3).times do # creating 1 to 3 cover letters for each user
    cover_letter = CoverLetter.new( # creating a cover letter
      company: Faker::Company.name,
      is_saved: true, # setting is_saved to true for all fake cover letters
      name: Faker::Name.name, # generating a random name
      user: user # assigning the user to the cover letter
    )
    cover_letter.save! # saving the cover letter
    rand(1..3).times do # creating 1 to 3 cover letter entries for each cover letter
      cover_letter_entry = CoverLetterEntry.new( # creating a cover letter entry
        text: Faker::Lorem.paragraph(sentence_count: 2), # generating a random paragraph
        cover_letter: cover_letter # assigning the cover letter to the cover letter entry
      )
      cover_letter_entry.save! # saving the cover letter entry
    end
  end
  rand(3..7).times do # creating 3 to 7 applications for each user
    application = Application.new( # creating an application
      company: Faker::Company.name,
      status: Application::STATUS.sample, # generating a random status
      link: Faker::Internet.url, # generating a random url
      notes: Faker::Quote.matz + " " + Faker::Quote.matz + " " + Faker::Quote.matz, # generating a random quote
      date: Faker::Date.between(from: 20.days.ago, to: Date.today), # generating a random date
      user: user # assigning the user to the application
    )
    application.save! # saving the application
  end
end

puts 'done!' # printing done when finished, to know when the seed is succesfully executed
