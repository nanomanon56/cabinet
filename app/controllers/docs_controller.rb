class DocsController < ApplicationController
	
	def index
		@doc =Doc.new
	end

	def show
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

	def update
	end

	def destory 
	end

       private

       def find_doc
       end

       def doc_params
       	doc.require(:doc).permit(:title, :content)
       end
end
