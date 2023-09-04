class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :jobs
  has_many :job_postings

 
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable

 
         # Método para verificar si un usuario es administrador
         def admin?
           admin
         end
end
