class Api::V1::PhotosController < Api::V1::BaseController
  before_action :set_photo, only: %i[show update destroy]

  def index
    @photos = policy_scope(Photo) # Photo.where(album_id: params[:album_id])
    @album = Album.find(params[:album_id])
  end

  private

  def photo_params
    params.require(:photo).permit(:index, :description)
  end

  def set_photo
    @photo = Photo.find(params[:id])
    # authorize @photo  # For Pundit
  end

  def render_error
    render json: { errors: @album.errors.full_messages },
           status: :unprocessable_entity
  end
end
