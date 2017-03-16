class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def check_save(user)
    if self.post.user == user
      if self.post.is_exist_check?
        before=self.post.check_answer
        if self==before
          return "이미 채택하셨습니다."
        else
          before.check = false
          before.save
          self.check=true
          self.save
          return "변경되었습니다."
        end
      else
        self.check=true
        self.save
        return "선정되었습니다."
      end
    else
      return "이 글의 작성자만 채택할 수 있습니다."
    end

  end
end
