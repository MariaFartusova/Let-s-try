namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_questions
    make_answers
    make_relationships
  end
end
def make_answers
  users = User.limit(6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.answers.create!(content: content) }
  end
end
    
def make_questions
  users = User.limit(6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.questions.create!(content: content) }
  end
end
