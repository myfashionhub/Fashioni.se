class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true, confirmation: true, email: true #name of validator class
  validates :terms_of_service, acceptance: true
  validates :password, length: {within: 10..20, wrong_length: "Wrong length", too_short: "It's too short", too_long: "Much long"}
end

# TERMS of SERVICE (FORM)
  <%= f.label :terms_of_service %>
  <%= f.checkbox :terms_of_service %>

# FORM:
<% if @user.errors.any? %>

 The form has <%= pluralize(@user.errors.count, 'error') %>
  <% @user.errors.full_messages.each do |msg| %>
  <ul>  
    <li><%= msg %></li>
  </ul>  
  <% end %>
<% end %>        

<%= f.label :email_confirmation %>
<%= f.text_field :email_confirmation %>


# USER CONTROLLER:
def create
  @user = User.new
  if @user.save
    redirect_to root_path
  else
    render 'new'
  end    
end


$ mkdir app/validators

touch email_validator.erb

class EmailValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless value =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      record.errors[attribute] << (options[:message] || 'not an email')
  end

end
