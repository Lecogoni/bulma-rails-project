class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all

    @product_info = [
      ["RAQUETTE BULLPADEL HACK 21", "https://www.bullpadel.com/5083-home_default/pala-bullpadel-hack-21.jpg"], 
      ["RAQUETTE BULLPADEL HACK CTR 21", "https://www.bullpadel.com/5095-home_default/pala-bullpadel-hack-ctr-21.jpg"],
      ["RAQUETTE BULLPADEL VERTEX 3 21", "https://www.bullpadel.com/5127-home_default/pala-bullpadel-vertex-3-21.jpg"], 
      ["RAQUETTE BULLPADEL VERTEX 3 CTR 21", "https://www.bullpadel.com/5123-home_default/pala-bullpadel-vertex-3-ctr-21.jpg"],
      ["RAQUETTE BULLPADEL VERTEX 3 COMFORT 21", "https://www.bullpadel.com/5119-home_default/pala-bullpadel-vertex-3-comfort-21.jpg"],
      ["RAQUETTE BULLPADEL HACK 21", "https://www.bullpadel.com/5083-home_default/pala-bullpadel-hack-21.jpg"], 
      ["RAQUETTE BULLPADEL HACK CTR 21", "https://www.bullpadel.com/5095-home_default/pala-bullpadel-hack-ctr-21.jpg"],
      ["RAQUETTE BULLPADEL VERTEX 3 21", "https://www.bullpadel.com/5127-home_default/pala-bullpadel-vertex-3-21.jpg"], 
      ["RAQUETTE BULLPADEL VERTEX 3 CTR 21", "https://www.bullpadel.com/5123-home_default/pala-bullpadel-vertex-3-ctr-21.jpg"],
      ["RAQUETTE BULLPADEL VERTEX 3 COMFORT 21", "https://www.bullpadel.com/5119-home_default/pala-bullpadel-vertex-3-comfort-21.jpg"]
    ]
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description)
    end
end
