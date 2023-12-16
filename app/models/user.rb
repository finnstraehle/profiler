class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,  # devise is a gem that provides authentication functionality for our Rails app
         :recoverable, :rememberable, :validatable  # these are the modules that we want to use

  has_many :cover_letters, dependent: :destroy  # has many cover letters, so if the user is deleted, the cover letters are deleted
  has_many :applications, dependent: :destroy # has many applications, so if the user is deleted, the applications are deleted
  has_many :resumes, dependent: :destroy  # has many resumes, so if the user is deleted, the resumes are deleted
end
