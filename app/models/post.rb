class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :comments, as: :commentable
  has_many :answers
  validates :user_id, presence: true

  #작성자 확인 메소드
  def is_writer?(user)
    return true if !user.nil? && user == self.user
    false
  end

  # 사용자 tag(게시판 이름)걸기
  def tag_save(tagNames)
    self.save
    if tagNames.class == Array
      tagNames.each do |tag|
        if Tag.is_name_exist?(tag)
          Tagging.create(post_id: self.id, tag_id: Tag.find_by_name(tag.downcase).id)
        else
          new_tag=Tag.create(name: tag, level: 2)
          Tagging.create(post_id: self.id, tag_id: new_tag.id)
        end
      end
    else
      if Tag.is_name_exist?(tagNames)
        Tagging.create(post_id: self.id, tag_id: Tag.find_by_name(tagNames.downcase).id)
      else
        new_tag=Tag.create(name: tagNames, level: 2)
        Tagging.create(post_id: self.id, tag_id: new_tag.id)
      end
    end
  end

  # 사용자 tag(게시판 이름)걸기
  def tag_update(tagNames)
    Tagging.where(post_id: self.id).each do |t|
      t.delete
    end
    if tagNames.class == Array
      tagNames.each do |tag|
        if Tag.is_name_exist?(tag)
          Tagging.create(post_id: self.id, tag_id: Tag.find_by_name(tag.downcase).id)
        else
          new_tag=Tag.create(name: tag, level: 2)
          Tagging.create(post_id: self.id, tag_id: new_tag.id)
        end
      end
    else
      if Tag.is_name_exist?(tagNames)
        Tagging.create(post_id: self.id, tag_id: Tag.find_by_name(tagNames.downcase).id)
      else
        new_tag=Tag.create(name: tagNames, level: 2)
        Tagging.create(post_id: self.id, tag_id: new_tag.id)
      end
    end
  end

  # 이미지만 뽑아내기
  def get_first_thumb
    if self.content.slice(/h([^<]+)(png|jpg|psd|gif|jpeg)/).nil?
      return "https://placehold.it/600x399"
    else
      self.content.slice(/h([^<]+)(png|jpg|psd|gif|jpeg)/)
    end
  end

  def is_exist_tag?(tag)
    result = false
    self.tags.each do |mytag|
      if mytag.name == tag.name
        result= true
        break
      else
        result = false
      end
    end
    return result
  end

  def where_post
    case self.category.name
      when 'blog' then
        {controller: :blogs, action: :show, id: self.id}
      when 'questions' then
        {controller: :questions, action: :show, id: self.id}
    end
  end

  def is_exist_check?
    result=false
    self.answers.each do |answer|
      if answer.check == true
        result = true
        break
      end
    end
    return result
  end

  def check_answer
    self.answers.each do |answer|
      if answer.check==true
        return answer
      end
    end
    return false
  end
end
