class WelcomeController < ApplicationController
  def health_check
    head 200
  end

  def index
    @hostname = hostname
  end

  private

  def hostname
    ENV['HOSTNAME']
  end
end
