class SessionsView
  def ask_username
    puts 'Enter the username:'
    gets.chomp
  end

  def ask_password
    puts 'Enter the password:'
    gets.chomp
  end

  def wrong_credentials
    puts "Wrong Credentials"
  end

  def correct_credentials
    puts "Welcome to Food Delivery!"
  end

end
