class User < ApplicationRecord

  validates :username,
              presence: { message: "field is required."},
              length: { minimum: 6, message: "must be at least 6 characters long." },
              uniqueness: { message: "isn't available. Please try another." }

  validates :password,
              length: { minimum: 6, message: "must be at least 6 characters long." },
              allow_nil: true

  validates :name,
              presence: { message: "field is required."}

  validates :session_token,
              presence: true,
              uniqueness: true

  validates :password_digest, presence: true

  has_many :photos,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: "Photo"



  has_many :likes      #no route specified for this because the like is actually made onto a photo, comment, etc. (see polymorphic structure of Likes table)
  has_many :comments   #no route specified for this because the comment is actually made onto a photo, user_id foreign key creates association
  has_many :followers  #other users that are following this user
  has_many :followings #other users that this user is following

  attr_reader :password

  after_initialize :ensure_session_token
  before_validation :ensure_session_token_uniqueness

  def photos_count
    self.photos.length
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = new_session_token
    ensure_session_token_uniqueness
    self.save!
    self.session_token
  end

  private

  def new_session_token
    SecureRandom::urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= new_session_token
  end

  def ensure_session_token_uniqueness
    while User.find_by(session_token: self.session_token)
      self.session_token = new_session_token
    end
  end

  def set_default_profile_pic
    self.profile_img_url = "https://res.cloudinary.com/dckkkjkuz/image/upload/v1500953840/instagram-color-fade_pvpssi.png"
  end

end
