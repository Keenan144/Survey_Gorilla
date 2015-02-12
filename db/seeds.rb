require 'faker'


def seed_user(count)
  count.times {User.create(email: Faker::Internet.email, password: 'cheese')}
end

def seed_survey(count, id)
  count.times {Survey.create(title: Faker::Lorem.word + " survey", user_id: id)}
end

def seed_questions(count, id)
  count.times {Question.create(title: Faker::Lorem.words(4).join("") + "?", survey_id: id)}
end

def seed_responses(count, id)
  count.times {Response.create(answer: Faker::Lorem.word + ".", question_id: id)}
end

def seed_all
  seed_user(10)
  User.all.each do |user|
    seed_survey(2, user.id)
    user.surveys.each do |survey|
      seed_questions(3, survey.id)
      survey.questions.each do |question|
        seed_responses(5, question.id)
      end
    end
  end
end

seed_all
