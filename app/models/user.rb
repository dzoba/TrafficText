class User < ActiveRecord::Base

  require 'twilio-ruby'
  require 'open-uri'

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :phone_number
  # attr_accessible :title, :body

  @sent = false

  def self.test
    #foo = User.arel_table
    #File.open("/home/chris/test.txt", "a+"){|f| f << User.all.count }

    if Time.now.hour < 10 and Time.now.hour > 7
	jsonResponse = open('http://dev.virtualearth.net/REST/V1/Routes?wp.0=35.80259497566688,-78.68124693632126&wp.1=35.85827365929672,-78.87722790241241&key=Ah8etcX-YlaQzIeeC6bMXfPVLABzN2fiQaXiVCVuwAXpmkVvVHLtw791AMZtz71z').read 
	File.open("./trafficLog.txt", "a+"){|f| f puts Time.now }
	if jsonResponse =~ /Moderate/ or jsonResponse =~ /Serious/
		File.open("./trafficLog.txt", "a+"){|f| f puts "Traffic" }
		if !@sent
			File.open("./trafficLog.txt", "a+"){|f| f puts "Text" }
			account_sid = 'AC5de685f1bd72481d944c1d0a9d1cdfdd'
    			auth_token = '0a5e29e579f7c4c40948256d6f430e38'
    			@client = Twilio::REST::Client.new account_sid, auth_token

    			@client.account.sms.messages.create(
      				:from => '+14195176883',
      				:to => '+19193957737',
      				:body => 'Check Traffic ' + Time.now.strftime("%A %B %d or %a %e/%m")
    			)
			@sent = true
		end
	end
    end   	
  # do something

    #Alert.find(:all, :conditions => ["? > ? AND ? < ?", Time.now, start, Time.now, end])

    #Alert.find(:all, :conditions => [" ? between ? AND ?", Time.now, :start, :end])


    # put your own credentials here
 #   account_sid = 'AC5de685f1bd72481d944c1d0a9d1cdfdd'
  #  auth_token = '0a5e29e579f7c4c40948256d6f430e38'

    # set up a client to talk to the Twilio REST API
   # @client = Twilio::REST::Client.new account_sid, auth_token

   # @client.account.sms.messages.create(
    #  :from => '+14195176883',
    #  :to => '+19193957737',
    #  :body => 'JUSTIN IN THE BIG TIME ' + Time.now.strftime("%A %B %d or %a %e/%m")
    #)
   end

  def self.reset
    @sent = true
  end
  
end
