require 'sinatra'
require 'slim'
require 'sass'

$twipps = []

class Twipp
  def initialize(author, content)
    @author = author
    @content = content
  end

  def author
    @author
  end

  def content
    @content
  end
end

get '/' do
  slim :index, locals: {
    author: 'this is the author',
    year: 1234,
    twipps: $twipps
  }
end

get '/styles.css' do
  scss :styles
end

get '/fonts/FiraSans-Light.otf' do
  content_type 'font/opentype'
  send_file File.join('fonts', 'FiraSans-Light.otf')
end

post '/' do
  @author = params[:author]
  @content = params[:content]

  $twipps << Twipp.new(@author, @content)

  redirect '/'
end