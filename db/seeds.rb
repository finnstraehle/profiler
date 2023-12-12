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
    phone: "+41 (0) 78#{rand(2593698..9593698)}", # random phone number
    linkedin: "https://www.linkedin.com/in/fs14",
  )
  user.save!
  cover_letter = CoverLetter.new( # creating a cover letter
    company: Faker::Company.name,
    is_saved: false, # setting is_saved to true for all fake cover letters
    name: Faker::Name.name, # generating a random name
    user: user # assigning the user to the cover letter
  )
  cover_letter.save! # saving the cover letter
  rand(4..6).times do # creating 4 to 6 cover letter entries for each cover letter
    cover_letter_entry = CoverLetterEntry.new( # creating a cover letter entry
      text: Faker::Quote.matz + " " + Faker::Quote.matz, # generating a random text
      cover_letter: cover_letter # assigning the cover letter to the cover letter entry
    )
    cover_letter_entry.save! # saving the cover letter entry
  end
  rand(3..7).times do # creating 3 to 7 applications for each user
    application = Application.new( # creating an application
      company: Faker::Company.name,
      status: Application::STATUS.sample, # generating a random status
      link: Faker::Internet.url, # generating a random url
      notes: Faker::Quote.matz + " " + Faker::Quote.matz + " " + Faker::Quote.matz, # generating a random note
      date: Faker::Date.between(from: 20.days.ago, to: Date.today), # generating a random date
      user: user # assigning the user to the application
    )
    application.save! # saving the application
  end
  resume = Resume.new( # creating a resume
    is_saved: false, # setting is_saved to false
    name: Faker::Job.title, # generating a random name for the resume
    company: Faker::Company.name, # generating a random company
    section_one: "Education", # setting section one to Education
    section_two: "Work Experience", # setting section two to Experience
    section_three: "Skills & Interests", # setting section three to Skills
    user: user # assigning the user to the resume
  )
  resume.save! # saving the resume
  rand(5..8).times do # creating 1 to 3 resume entries for each resume
    resume_entry = ResumeEntry.new( # creating a resume entry
      title: Faker::Company.name, # generating a random title
      subtitle: Faker::Job.title, # generating a random subtitle
      location: Faker::Address.city, # generating a random location
      start: Faker::Date.between(from: 20.days.ago, to: Date.today), # generating a random start date
      end: Faker::Date.between(from: 20.days.ago, to: Date.today), # generating a random end date
      section: rand(1..3), # generating a random section
      is_active: true, # setting is_active to true
      resume: resume # assigning the resume to the resume entry
    )
    resume_entry.save! # saving the resume entry
  end
end

puts 'done!' # printing done when finished, to know when the seed is succesfully executed
