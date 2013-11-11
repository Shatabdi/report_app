module ApplicationHelper
	# desc: overiding the method of users
  # @return [Object]
	def resource_name
    :user
  end

  # desc: overiding the resource method of the users
  # @return [Object]
  def resource
    @resource ||= User.new
  end

  # desc: overiding the devise_mapping method of users
  # @return [Object]
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
