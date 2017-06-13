class IsImageValidator < ActiveModel::Validator
  def validate(article)
    if(!article.img_path.empty?)
      if !article.img_path.include? ".jpg" and !article.img_path.include? ".png" and !article.img_path.include? ".jpeg"
        article.errors[:base] << "Please, upload JPG, JPEG or PNG images only."
      end
    end
  end
end

class Article < ApplicationRecord
  validates :title, presence: true
  validates_uniqueness_of :title
  validates_with IsImageValidator
end
