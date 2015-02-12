require 'faker'

def seed_user(count)
  count.times {User.create(email: Faker::Internet.email, password: 'cheese')}
end

def seed_survey(count)
  count.times {Survey.create(title: Faker::Lorem.word + " survey")}
end

def seed_questions(count)
  count.times {Question.create(title: Faker::Lorem.sentence(4) + "?")}
end

def seed_responses(count)
  count.times {Response.create(answer: Faker::Lorem.word + ".")}
end

def seed_all_the_things

end
