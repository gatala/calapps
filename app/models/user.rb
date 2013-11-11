class User < ActiveRecord::Base

  before_save {self.email = email.downcase}
  before_create :create_remember_token

  validates :name, :presence => true, length: {:within => 3..25}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, 
  					format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: {:within => 8..20}

  #validates :is_admin, :presence => true

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  # def is_admin=(flag)
  #   @user.is_admin = flag
  # end


  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
