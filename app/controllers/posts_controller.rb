class PostsController < ApplicationController
    before_action :set_post,  only: [:show, :update, :edit, :destroy]

    def index
        @posts = Post.all
    end

    def show
        @post
    end


    def new
        @post = Post.new
    end

    def edit

    end

    def create
        @post = Post.new(post_params)

        if @post.save
            flash[:notice] = "Post criado com sucesso."
            redirect_to action: :show, id: @post.id
        else
            render :new
        end
    end

    def update 
        if @post.update(post_params)
            flash[:notice] = "Post atualizado com sucesso."
            redirect_to action: :show, id: @post.id
        else
            render :edit
        end
    end

    def destroy 
        @post.destroy
        flash[:notice] = "Post excluido com sucesso."
        redirect_to action: :index
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content)
    end
end
