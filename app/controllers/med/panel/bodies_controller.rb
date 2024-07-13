module Med
  class Panel::BodiesController < Panel::BaseController
    before_action :set_body, only: [:show, :edit, :update, :destroy, :actions]
    before_action :set_new_body, only: [:new, :create]

    def index
      @bodies = Body.page(params[:page])
    end

    private
    def set_body
      @body = Body.find(params[:id])
    end

    def set_new_body
      @body = Body.new(body_params)
    end

    def body_params
      params.fetch(:body, {}).permit(
        :name,
        :image,
        :images
      )
    end

  end
end
