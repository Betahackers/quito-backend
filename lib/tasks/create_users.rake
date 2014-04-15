task create_users: :environment do 
  email_array = ENV['emails'].split(',')
  required_attributes = [:first_name, :last_name, :about, :profession, :nationality, :expert_in]
  email_array.each do |email|
    user = User.new(email: email.strip, password: '21ed3!38#NOibb', role: 'member')
    required_attributes.each do |attribute|
      user.update_attribute(attribute, 'change me')
    end
    puts user.save
  end
end
    
  
