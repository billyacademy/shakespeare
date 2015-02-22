require 'factory_girl_rails'

FactoryGirl.define do
  factory :play do
    title "Bye Bye Birdie"
  end
end

FactoryGirl.define do
  factory :act do
    title "ACT I - Hello Birdie"
    play_id 1
  end
end

FactoryGirl.define do
  factory :scene do
    title "The Bird Flies"
    act_id 1
  end
end

FactoryGirl.define do
  factory :role do
    name "Bird Man"
    play_id 1
  end
end

FactoryGirl.define do
  factory :speech do
    scene_id 1
    role_id 1
  end
end

FactoryGirl.define do
  factory :line do
    sequence(:message) { |n| "This is line #{n} for the character" }
    speech_id 1
    # speech
    # role
    # scene
    # act
    # play
  end
end
