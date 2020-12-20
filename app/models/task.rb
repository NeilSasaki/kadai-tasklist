class Task < ApplicationRecord
    
    #before_action :require_user_logged_in
    validates :content,presence: true, length: { maximum:255 }
    validates :status,presence: true, length: { maximum:10 }
    belongs_to :user #ユーザーとタスクが１対多の関係
end

