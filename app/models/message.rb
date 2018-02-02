class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  after_create_commit do
    MessageBroadcastJob.perform_later(self)
  end
end
