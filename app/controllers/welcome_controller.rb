class WelcomeController < ApplicationController
  def health_check
    head 200
  end
end
