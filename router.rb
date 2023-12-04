get '/' do
  @urls = Url.all
  erb :index
end

get '/new' do
  erb :new
end

get '/delete/:id' do
  Url.destroy(params[:id])

  redirect '/'
end

post '/shorten' do
  original_url = params[:original_url]
  url = Url.create!(original_url: original_url)

  url.short_url
end

get '/:short_url' do
  short_url = params[:short_url]
  url = Url.find_by!(short_url: short_url)
  return 'Url bulunamadı.' unless url

  url.clicks += 1
  url.save

  redirect url.original_url
end
