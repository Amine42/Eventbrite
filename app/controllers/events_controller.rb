class EventsController < ApplicationController
  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @event = Event.all
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    if Event.last.id < params[:id].to_i || Event.first.id > params[:id].to_i
      redirect_to '/'
    else
      @event = Event.find(params[:id])
    end
  end

  def new
    # Méthode qui crée un potin vide et l'envoie une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    if params[:title] == "" || params[:description] == "" || params[:price] == "" || params[:location] == "" || params[:duration] == "" || params[:duration].to_i % 5 != 0 || params[:start_date] == "" 
      redirect_to new_event_path
      puts "non tu a pas remplit le formulaire"
    else
      @event = Event.create!(title: params["title"], description: params["description"], price: params["price"], location: params["location"], duration: params["duration"], start_date: params["start_date"], admin_id: current_user.id)
      redirect_to event_path(@event.id)
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @event = Event.find(params[:id])
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    @event = Event.find(params[:id])
    post_params = params.require(:event).permit(:title, :description, :location, :start_date, :duration, :price)
    @event.update(post_params)
    redirect_to event_path(@event.id)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @event = Event.find(params[:id])
    if current_user == @event.admin_id
      puts "#" * 30
      @event.delete
    end
    redirect_to "/"
  end
end
