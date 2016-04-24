require 'sinatra'
require 'sinatra/reloader'

# get '/hello/:first/?:last?' do |f, l|
#   "hello #{f} #{l}"
# end

# get '/from/*/to/*' do |f, l|
#   "from #{f} to #{l}"

# get %r{/users/([0-9]*)} do |i|
#   "user id #{i}"
# end

# get '/:name' do |n|
#   @name = n
#   @content = "main content"
#   erb :index
# end

# 前処理 後処理
before do
  @author = "ucchi"
end

after do
  logger.info "page displayed successfully"
end

# メソッド
helpers do
  def strong(s)
    "<strong>#{s}</strong>"
  end
end

get '/' do
  @content = "mail is"
  @name = @author
  erb :index
end

get '/about' do
  @content = "mail is"
  @mail = "stmail " + strong(@author)
  erb :about
end
