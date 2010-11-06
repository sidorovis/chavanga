class PostComment < ActiveRecord::Base
    validates_presence_of :title, :answer, :post_id
    belongs_to :post
end
