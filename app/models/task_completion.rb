class TaskCompletion < ApplicationRecord
  belongs_to :challenge_subcription
  belongs_to :task
end
