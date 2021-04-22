module Med
  class Panel::BodiesController < Panel::BaseController
    before_action :set_body, only: [:show, :edit, :update, :destroy]

    def index
      @bodies = Body.page(params[:page])
    end

    def new
      @body = Body.new
    end

    def create
      @body = Body.new(body_params)

      unless @body.save
        render :new, locals: { model: @body }, status: :unprocessable_entity
      end
    end

    def show
    end

    def edit
    end

    def update
      @body.assign_attributes(body_params)

      unless @body.save
        render :edit, locals: { model: @body }, status: :unprocessable_entity
      end
    end

    def destroy
      @body.destroy
    end

    private
    def set_body
      @body = Body.find(params[:id])
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
