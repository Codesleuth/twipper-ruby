require 'sinatra'
require 'redcarpet'
require 'slim'

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

get '/hi' do
  "Hello World!"
end

post '/' do
  @author = params[:author]
  @content = params[:content]

  $twipps << Twipp.new(@author, @content)

  slim :index, locals: {
    author: 'this is the author',
    year: 1234,
    twipps: $twipps
  }
end