task create_users: :environment do 
  email_array = ENV['emails'].split(',')
  required_attributes = [:first_name, :last_name, :about, :profession, :nationality, :expert_in]
  email_array.each do |email|
    user = User.where(email: email.downcase.strip).first_or_initialize(password: '21ed3!38#NOibb', role: 'member')
    if user.persisted?
      puts "Found User #{user.id}"
    else      
      required_attributes.each {|a| user.update_attribute(a, 'change me')}
      puts "Saved user?"
      puts user.save  
    end
    puts user.send_reset_password_instructions
  end
end
    
  
