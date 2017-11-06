class DocsController < ApplicationController
	before_action :find_doc, only: [:show, :edit, :update, :destroy]

	def index
       @docs = Doc.all.order("created at DESC")
	end

	def show
		@doc =Doc.find(params[:id])
	end

	def new
		@doc =Doc.new
	end

	def create 
		@doc =Doc.new(doc_params)

		if @doc.save
			redirect_to @doc
		else 
			render 'new'
		end
	end

	def edit
	end	

	def update
		if @doc.update(doc_params)
			redirect_to @doc
		else
			render 'edit'
		end
	end

	def destory 
		@doc.destory
		redirect_to_docs_path
	end

       private

       def find_doc
       	@doc =Doc.find(params[:id])
       end

       def doc_params
       	doc.require(:doc).permit(:title, :content)
       end
end
