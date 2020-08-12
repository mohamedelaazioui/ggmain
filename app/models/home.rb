class Home < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true
  #validates :name, presence: true, length: { minimum: 2}
  #validates :email, presence: true, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }
  #validates :message, presence: true, length: { minimum: 2}
  #validates :nickname, presence: true, captcha: true
  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
        :subject => "Contact Form #{name} #{email}",
        :to => "gibu.gumi@gmail.com",
        :from => %("#{name}" <#{email}>)
    }
  end
end
