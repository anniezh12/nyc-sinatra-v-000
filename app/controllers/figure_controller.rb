class FiguresController<ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])
    # following if statement will check if a lanmark is picked it will create a new landmark instance and  will push it into the landmarks array of Figure class
    if !params["landmark"]["name"].empty?
    @figure.landmarks << Landmark.create(params[:landmark])
    end
    #following if statement will check if a title is picked it will create a new title instance will push it into the titles array of Figure class
    if !params["title"]["name"].empty?
    @figure.titles << Title.create(params["title"])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params["landmark"])
    end

    if !params["title"]["name"].empty?
    @figure.titles << Title.create(params["title"])
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
