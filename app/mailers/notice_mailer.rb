class NoticeMailer < ActionMailer::Base
  default from: "noreply@example.com"

  def sendmail_confirm(blog, entry, comment)
    @blog = blog
    @entry = entry
    @comment = comment
    mail to: "admin@example.com",
         subject: "新しいコメントが投稿されました",
         template_name: "sendmail_confirm.text.haml"
  end

end