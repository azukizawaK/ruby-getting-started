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
                       text: "＝LOVE　とは
                       
                       
指原莉乃が自身の理想のアイドルをプロデュースするために、声優学校として業界一の歴史と実績を誇る代々木アニメーション学院による「声優教育」を施した新しい「声優アイドル」の初期メンバーを決めるオーディションを実施しました。

去る4月29日、オーディション最終審査が行われ、指原莉乃プロデューサー自ら、グループ名を「＝LOVE（イコールラブ）」とすることを発表しました。
「＝LOVE（イコールラブ）」という名前には、「アイドルとはファンに愛されなければいけない。そしてアイドルという仕事も自分が愛さなければいけない。」という想いが詰まっています。

指原莉乃が理想のアイドルを初プロデュースするにあたり、次の通り意気込みを語っております。

「アイドルになりたいと思っているだけじゃダメ。まず行動しよう。
9年前の私のように悩んでいる人の背中を押してあげたいです。「好きなことから始めよう」て。
私なんかに何ができるかわからないけど、
アイドルヲタの立場から私の理想のアイドルをプロデュースしたいです。」
指原莉乃"
                       
                   }
                   client.reply_message(event["replyToken"], message)
                   elsif event.message["text"] == "＝LOVE"
                   message = {
                       
                       type: "text",
                       text: "＝LOVE　とは
                       
                       
指原莉乃が自身の理想のアイドルをプロデュースするために、声優学校として業界一の歴史と実績を誇る代々木アニメーション学院による「声優教育」を施した新しい「声優アイドル」の初期メンバーを決めるオーディションを実施しました。

去る4月29日、オーディション最終審査が行われ、指原莉乃プロデューサー自ら、グループ名を「＝LOVE（イコールラブ）」とすることを発表しました。
「＝LOVE（イコールラブ）」という名前には、「アイドルとはファンに愛されなければいけない。そしてアイドルという仕事も自分が愛さなければいけない。」という想いが詰まっています。

指原莉乃が理想のアイドルを初プロデュースするにあたり、次の通り意気込みを語っております。

「アイドルになりたいと思っているだけじゃダメ。まず行動しよう。
9年前の私のように悩んでいる人の背中を押してあげたいです。「好きなことから始めよう」て。
私なんかに何ができるかわからないけど、
アイドルヲタの立場から私の理想のアイドルをプロデュースしたいです。」
指原莉乃"
                       
                   }
                   client.reply_message(event["replyToken"], message)
                   
                   elsif event.message["text"] == "いこーるらぶ"
                   message = {
                       
                       type: "text",
                       text: "＝LOVE　とは
                       
                       
指原莉乃が自身の理想のアイドルをプロデュースするために、声優学校として業界一の歴史と実績を誇る代々木アニメーション学院による「声優教育」を施した新しい「声優アイドル」の初期メンバーを決めるオーディションを実施しました。

去る4月29日、オーディション最終審査が行われ、指原莉乃プロデューサー自ら、グループ名を「＝LOVE（イコールラブ）」とすることを発表しました。
「＝LOVE（イコールラブ）」という名前には、「アイドルとはファンに愛されなければいけない。そしてアイドルという仕事も自分が愛さなければいけない。」という想いが詰まっています。

指原莉乃が理想のアイドルを初プロデュースするにあたり、次の通り意気込みを語っております。

「アイドルになりたいと思っているだけじゃダメ。まず行動しよう。
9年前の私のように悩んでいる人の背中を押してあげたいです。「好きなことから始めよう」て。
私なんかに何ができるかわからないけど、
アイドルヲタの立場から私の理想のアイドルをプロデュースしたいです。」
指原莉乃"
                       
                   }
                   client.reply_message(event["replyToken"], message)
                   
                   elsif event.message["text"] == "=LOVE"
                   message = {
                       
                       type: "text",
                       text: "＝LOVE　とは
                       
                       
指原莉乃が自身の理想のアイドルをプロデュースするために、声優学校として業界一の歴史と実績を誇る代々木アニメーション学院による「声優教育」を施した新しい「声優アイドル」の初期メンバーを決めるオーディションを実施しました。

去る4月29日、オーディション最終審査が行われ、指原莉乃プロデューサー自ら、グループ名を「＝LOVE（イコールラブ）」とすることを発表しました。
「＝LOVE（イコールラブ）」という名前には、「アイドルとはファンに愛されなければいけない。そしてアイドルという仕事も自分が愛さなければいけない。」という想いが詰まっています。

指原莉乃が理想のアイドルを初プロデュースするにあたり、次の通り意気込みを語っております。

「アイドルになりたいと思っているだけじゃダメ。まず行動しよう。
9年前の私のように悩んでいる人の背中を押してあげたいです。「好きなことから始めよう」て。
私なんかに何ができるかわからないけど、
アイドルヲタの立場から私の理想のアイドルをプロデュースしたいです。」
指原莉乃"
                       
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
                     previewImageUrl: @idols.photo
                 }
             ]
                
             client.reply_message(event["replyToken"], message)
             end
            end
         end
       }
       head :ok
   end
end