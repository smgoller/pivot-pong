class Admin::BaseController < ApplicationController
  layout 'admin'

  private

  def authenticate
    user = ENV['admin_username'] || "admin"
    pass = ENV['admin_password'] || "pingpong"
    unless Rails.env.test?
      authenticate_or_request_with_http_basic do |username, password|
        username == user && password == pass
      end
    end
  end
end