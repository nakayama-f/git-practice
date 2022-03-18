class Book < ApplicationRecord

  validates :title, presence: true, on: :create
  validates :body, presence: true, on: :create
  validates :title, presence: true, on: :
  validates :body, presence: true, on: :update
  
end
