* migration:
add_column :fashionistas, :password_digest, :string

* fashionista model:
has_secure_password  # ActiveModel

* Gemfile
gem 'bcrypt', '~> 3.1.7'

* form:
<%= f.label :password %>
<%= f.password_field :password %>
<%= f.label :password_confirmation %>
<%= f.password_field :password_confirmation %>

# authenticate.....
http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html

* touch sessions_controller.rb

def new
  #log in form
end

def create
  @user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to root_path, notice: "Signed in as #{user.username}" 
  else
    redirect_to login_path, alert: 'Log in failed' 
  end  
end

def destroy
  session[:user_id] = nil
  redirect_to login_path, notice: 'Logged out' 
end

* routes
get 'sessions/new' => 'sessions#new' as: 'login'
post 'sessions' => 'sessions#create'
delete 'sessions' => 'sessions#destroy', as: 'logout'

get 'profiles' => 'profiles#index'

* Log in form:
<%= form_tag sessions_path do %>
  <%= label_tag :email %>
  <%= text_field_tag :email %>
  <%= label_tag :password %>
  <%= password_field_tag :password %>  
  <%= submit_tag %>
<% end %>


* Application Controller:
helper_methods :current_user

def current_user 
  User.find(session[:user_id]) if session[:user_id]
end

def authorize  
  redirect_to root_path if current_user.nil? #login
end


* Fashionista controller:
def index
  @user = current_user
end

* index:
<% if current_user %>
  <%= link_to "Log out", logout_path, method: :delete %>
<% else %>
  <%= link_to "Log in", login_path, method: :get %>
<% end %>


* touch ProfilesController < ApplicationController
  before_action :authorize, only: [:index]
# authorize in ApplicationController
def index
end

* index:
<%= current_user.email %>
Edit/delete profile


* Layout:
<% if flash %>
<%= flash.now[:alert] %>

<%= flash.now[:notice] %>
