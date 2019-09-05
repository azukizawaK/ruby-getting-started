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
     
#     def callback
#      body = request.body.read
#   
#       signature = request.env["HTTP_X_LINE_SIGNATURE"]
#       unless client.validate_signature(body, signature)
#         error 400 do "Bad Request" end
#       end
   
#       events = client.parse_events_from(body)
#   
#       events.each { |event|
#         case event
#         when Line::Bot::Event::Message
#           case event.type
#           when Line::Bot::Event::MessageType::Text
#             message = {
#               type: "text",
#               text: event.message["text"] + "!"
#             }
#             client.reply_message(event["replyToken"], message)
#           end
#         end
#       }
   
   
def send(line_ids, message)

   @idol=Idol.offset( rand(Idol.count) ).first
# Postからランダムで返事を選ぶ。


    post('/v1/events', {

            to: line_ids,
            content: {
                contentType: ContentType::TEXT,
                toType: ToType::USER,
                text: @post.name #返事をPostから取ってくる。
            },

            toChannel: TO_CHANNEL,
            eventType: EVENT_TYPE,



        })
        
       head :ok
     end
 end
