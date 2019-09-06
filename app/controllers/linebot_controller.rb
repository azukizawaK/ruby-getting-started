 class LinebotController < ApplicationController
     require "line/bot"  # gem "line-bot-api"
 
     # callbackアクションのCSRFトークン認証を無効
     protect_from_forgery :except => [:callback]
 
     def client
       @client ||= Line::Bot::Client.new { |config|
         config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
         config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
       }
     end
     
     def callback
      body = request.body.read
      
      @idols = Idol.offset( rand(Idol.count) ).first #アイドルの情報
     
   
       signature = request.env["HTTP_X_LINE_SIGNATURE"]
       unless client.validate_signature(body, signature)
         error 400 do "Bad Request" end
       end
  
       events = client.parse_events_from(body)
   
       events.each { |event|
         case event
         when Line::Bot::Event::Message
           case event.type
           when Line::Bot::Event::MessageType::Text
               
               
               if event.message["text"] == "イコールラブ"
                   message = {
                       
                       type: "text",
                       text: "http://equal-love.jp/"
                       
                   }
                   client.reply_message(event["replyToken"], message)
                   
               else
                   
               
             message = [
                 {
                     type: "text",
                     text: @idols.name
                 },
                 {
                     type: "text",
                     text: @idols.profile
                 },
                 {
                     type: "image",
                     originalContentUrl: @idols.photo,
                     previewImageUrl: @iodls.photo
                 }
             ]
                
             client.reply_message(event["replyToken"], message)
           end
       end
   end
       
       
       head :ok
     }
 end