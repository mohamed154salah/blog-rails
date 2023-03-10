#name:string , userName:string , password_digest:string
# (password:string , password_confirmation:string) virtual attributes by bcrypt

class User < ApplicationRecord
    has_many:articles
    has_many:comments
    has_secure_password
    validates :userName , presence: true , uniqueness: true
    #validates :password, presence: true, length: { minimum: 6 }
    validates :name, presence: true
end
