class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end

    def show
        id = params[:id]
        @movie = Movie.find(id)
    end

    def create
    end

    def new
        @movie = Movie.new
    end
    
    def create
        if (@movie = Movie.create(movie_params))
            redirect_to movies_path, :notice => "#{@movie.title} created."
        else
            flash[:alert] = "Movie #{@movie.title} could not be created: " + @movie.errors.full_messages.join(",")
            render 'new'
        end
    end

    def edit
        @movie = Movie.find params[:id]
    end

    def update
        @movie = Movie.find params[:id]
        if @movie.update movie_params
            redirect_to movie_path(@movie), notice: "#{@movie.title} updated"
        else
            flash[:alert] = "#{@movie.title} could not be created: " + @movies.errors.full_messages.join(",")
            render "edit"
        end
    end

    def destroy
        @movie = Movie.find params[:id]
        @movie.destroy
        redirect_to movies_path, notice: "#{@movie.title} deleted."
    end

    private
    def movie_params
        params.require(:movie)
        params[:movie].permit(:title,:rating,:release_date)
    end
end