class User < ActiveRecord::Base

  attr_accessible :image, :name, :email, :password, :password_confirmation, 
  :school, :year, :public_name, :github, :major

  before_save {self.email = email.downcase}

  #VALID_NAME_REGEX = /[a-zA-z]*\s[a-zA-Z]*\W[a-zA-z]*/
  validates :name, 
            :presence => true, 
            length: {:within => 3..25},
            #format: {with: VALID_NAME_REGEX}

  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, 
  					format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false }

  #VALID_PASSWORD_REGEX = /[a-zA-Z\d]*/
  has_secure_password
  validates :password, 
            length: {:within => 8..20, allow_nil: true},
            #format: {with: VALID_PASSWORD_REGEX}
  
  mount_uploader :image, ImageUploader

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
      begin 
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
  end

  has_many :calapps

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end



end
