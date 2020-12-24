class User < ApplicationRecord
    before_save { self.email.downcase! }
    #nameのバリデーション
    validates :name, presence: true, length: { maximum: 50 }
    #e-mailのバリデーション
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    
    #パスワード、パスワード確認のバリデーション                
    validates :password, confirmation: true
    #validates :password_confirmation, presence: true  
    
    
    has_secure_password
    
    has_many :tasks #Userから見たときにタスクが複数ある
end
