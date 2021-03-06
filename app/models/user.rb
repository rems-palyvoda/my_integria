class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :registerable :recoverable

  devise :database_authenticatable, :rememberable, :trackable, :validatable

  validates :name, presence: true  

  has_many :companies_permits, dependent: :destroy
  has_many :companies, through: :companies_permits

  has_many :apparats_permits, dependent: :destroy
  has_many :apparats, through: :apparats_permits

  def not_permited_apparats
    Apparat.all - self.apparats
  end

  def not_permited_companies
    Company.all - self.companies
  end
  
end
