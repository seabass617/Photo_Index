class Api::V1::AlbumsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_album, only: [ :show, :update, :destroy ]


  def index
    @albums = policy_scope(Album)
  end

  def show
  end

  def update
    if @album.update(album_params)
      render :show
    else
      render_error
    end
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    authorize @album
    if @album.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @album.destroy
    head :no_content
  end

  private

  def album_params
    params.require(:album).permit(:name, :index, :description)
  end

  def set_album
    @album = Album.find(params[:id])
    authorize @album  # For Pundit
  end

  def render_error
    render json: { errors: @album.errors.full_messages },
      status: :unprocessable_entity
  end
end