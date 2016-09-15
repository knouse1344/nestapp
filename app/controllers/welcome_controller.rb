class WelcomeController < ApplicationController
  def index
  end

  def blog
  	@blogposts = Blogpost.all
  end
end
