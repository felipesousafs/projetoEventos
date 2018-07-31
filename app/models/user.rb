class User < ApplicationRecord
  rolify
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  has_many :inscriptions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def add_tags(params)
    list_of_tags = params[:user][:tags_list].join(',')
    logger.info(list_of_tags)
    self.tag_list = list_of_tags
    self.save
  end

  def tags_list
    tag_list.join(',')
  end

  def to_s
    email
  end
end
