class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create

    img = params[:article][:img]

    if !params[:article][:img_path].to_s.empty?
      img_path = params[:article][:img_path]
    elsif img
      img_path = img.original_filename
    else
      img_path = ''
    end

    parameters = {
      "title" => article_params[:title],
      "text" => article_params[:text],
      "img_path": img_path
    };

    @article = Article.new(parameters)

    respond_to do |format|
      if @article.save
        NewsletterMailer.article_email(@article).deliver_later
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
        if(img_path != '')
          path = File.join(Rails.root,
            "app/assets/images",img_path)
            File.open(path, "wb") do |f|
            f.write(img.read)
          end
        end
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    img = params[:article][:img]
    if !params[:article][:img_path].to_s.empty?
      img_path = params[:article][:img_path]
    elsif img
      img_path = img.original_filename
    else
      img_path = ''
    end
    parameters = {
      "title" => article_params[:title],
      "text" => article_params[:text],
      "img_path": img_path
    };
    respond_to do |format|
      if @article.update(parameters)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
        if(img_path != '')
          path = File.join(Rails.root,
            "app/assets/images",img_path)
            File.open(path, "wb") do |f|
            f.write(img.read)
          end
        end
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if @article.img_path != ''
      File.delete('app/assets/images/' + @article.img_path) if File.exist?('app/assets/images/' + @article.img_path)
    end
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :text, :img)
    end
end
