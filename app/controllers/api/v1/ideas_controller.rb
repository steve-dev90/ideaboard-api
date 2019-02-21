module Api::V1
  class IdeasController < ApplicationController
    def index
      @ideas = Idea.all
      render json: @ideas.order("created_at DESC")
    end

    def create
      @idea = Idea.create(idea_params)
      render json: @idea
    end

    def update
      @idea = Idea.find(params[:id])
      @idea.update_attributes(idea_params)
      render json: @idea
    end

    private

    def idea_params
      params.require(:idea).permit(:title, :body)
    end
  end
end