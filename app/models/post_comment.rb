class PostComment < ActiveRecord::Base
    validates_presence_of :author, :answer, :post_id
    belongs_to :post
end
