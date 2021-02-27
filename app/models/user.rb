# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  belongs_to :role, optional: true
  validates :name, presence: true
  before_save :assign_role

  has_one_attached :avatar do |attachable|
   attachable.variant :thumb, resize: "100x100"
  end
  
  def assign_role
    self.role = Role.find_by name: 'User' if role.nil?
  end

  def admin?
    role.name == 'Admin'
  end

  def user?
    role.name == 'User'
  end
end
