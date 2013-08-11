
require 'rest_client'
require 'nokogiri'
require 'open-uri'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

module Elance
	def email_exists?( input_email )

		# get a valid token
		login_page = open('https://www.elance.com/php/landing/main/login.php').read()
		token = Nokogiri::HTML( login_page ).css('#token').attr('value').value()

		# try authentication
		response =  RestClient.post( 'https://www.elance.com/php/reg/main/signInAHR.php?t=1376232800475',
				 { :token => token,
				   :mode => 'signin',
				   :crypted => '',
				   :login_type => '',
				   :redirect => '',
				   :lnm => input_email,
				   :pwd => '12345' } )

		return response.include?('do not match')

	end
end
