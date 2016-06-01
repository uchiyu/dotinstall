require 'active_record'
require 'logger'

ActiveRecord::Base.establish_connection(
  'adapter' => 'sqlite3',
  'database' => './blog.db'
)

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, length: { minimum: 5 }

  scope :top3, -> { order('created_at').limit(3) }
end

#------------------------------------------
# varidate
#------------------------------------------
# post = Post.new(body: '123')
# p post.save

# if !post.save
#   p post.errors
# end

# 発行されたSQLの表示
# ActiveRecord::Base.logger = Logger.new(STDOUT)

#------------------------------------------
# レコードの挿入
#------------------------------------------
# post = Post.new(title: 'title1', body: 'hello1')

# post = Post.new
# post.title = 'title2'
# post.body = 'hello2'

# post = Post.new do |p|
#  p.title = 'title3'
#  p.body = 'hello3'
# end
#
# post.save

# Post.create(title: 'title4', body: 'hello4')

#------------------------------------------
# データの抽出
#------------------------------------------
# p Post.all
# p Post.first
# p Post.last.title
# p Post.find_by_title_and_id("title3", 4)

# p Post.where(title: 'title1', id: 1)
# p Post.where("title = ? and id = ?", 'title1', 1)
# p Post.where('title = :title and id = :id', { title: 'title1', id: 1 })

# p Post.where('id > ?', 2)
# Post.where('body like ?', 'hello%')
# p Post.where(id: 1..3)
# p Post.where(id: [1, 4])

# p Post.order('id desc').limit(3)
# p Post.top3

#------------------------------------------
# 検索しなければ登録
#------------------------------------------
# Post.where(title: 'title5').first_or_create
# Post.where(title: 'title6').first_or_create do |p|
#   p.body = 'hello6'
# end
# p Post.all

#------------------------------------------
# レコードの更新
#------------------------------------------
# post = Post.find(1)
# post.title = 'new title1'
# post.save

# post.update_attributes(title: 'new2 title1', body: 'hhh')

# Post.where(id: 1..3).update_all(title: 'nnn2', body: 'hhh2')

# p Post.all

#------------------------------------------
# レコードの削除
#------------------------------------------
# Post.where(id: 1..2).delete_all
# Post.find(3).destroy
p Post.all
