require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @albums = Album.all
  erb(:albums)
end
get('/albums') do
  if params["search"]
    @albums = Album.search_name(params[:search])
  else
    @albums = Album.all
  end
  erb(:albums)
end

get('/albums/new') do
  erb(:new_album)
end

post('/albums') do
  name = params[:album_name]
  album = Album.new(name, nil)
  album.save()
  @albums = Album.all() # Adding this line will fix the error.
  erb(:albums)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

get('/albums/:id/buy') do
  @album = Album.find(params[:id].to_i())
  erb(:buy_album)
end

patch('/albums/:id') do
  if params[:buy]
    @album = Album.find(params[:id].to_i())
    @album.sold
  else
    @album = Album.find(params[:id].to_i())
    @album.update(params[:name])
    @album.sold(params[:status])
  end
  @albums = Album.all
  erb(:albums)
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
end
