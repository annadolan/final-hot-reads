class Api::V1::LinksController < ApiController
  def create
    @link = Link.find_or_initialize_by(link_params)
    @link.read_count += 1
    if @link.save
      render json: @link, status: 200
    else
      render status: 400
    end
  end

  private
    def link_params
      params.require(:link).permit(:url)
    end
end
