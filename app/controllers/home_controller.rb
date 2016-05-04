require 'mailgun'
class HomeController < ApplicationController
  def index
  end
  def comic
    @almond = params[:title]
    @anchovy = params[:content]
    @cherry = params[:email]
    
    mg_client = Mailgun::Client.new('key-a4d76ece2d0b7aba92eeaed0cf85180b')

    message_params =  {
                   from: 'qor900813@naver.com',
                   to:   @cherry,
                   subject: @almond,
                   text:    @anchovy
                  }

    result = mg_client.send_message('sandbox94a46dd277924e5ea5ec36f07e15b9b2.mailgun.org', message_params).to_h!

    message_id = result['id']
    message = result['message']
  end
end
