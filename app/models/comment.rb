class Comment < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :chef
  
  validates :body, presence: true
  
  def self.persisted
    where.not(id: nil)
  end
end
