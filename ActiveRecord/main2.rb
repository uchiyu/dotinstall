require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./blog.db"
)

class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
end

class Comment < ActiveRecord::Base
  belongs_to :post
end

# post = Post.find(1)
# post.comments.each do |comment|
#   p comment.body
# end

p Post.all
p Comment.all
puts

Post.find(1).destroy
p Post.all
p Comment.all

