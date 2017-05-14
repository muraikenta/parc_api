# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  name                   :string
#  image                  :string
#  email                  :string
#  tokens                 :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  favorites_count        :integer          default("0")
#  profile                :text
#  username               :string
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

class User < ActiveRecord::Base
  attr_accessor :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :authentication_keys => [:login] # temporally remove :confirmable

  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true
  validates :username,
    uniqueness: { case_sensitive: :false },
    length: { minimum: 4, maximum: 20 }

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # Follow relations
  has_many :active_relationships, class_name: 'Follow', foreign_key: 'user_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Follow', foreign_key: 'target_user_id', dependent: :destroy

  has_many :followings, -> { order('follows.id desc') }, through: :active_relationships, source: :target_user
  has_many :followers, -> { order('follows.id desc') }, through: :passive_relationships, source: :user

  has_many :active_messages, class_name: 'Message', foreign_key: 'user_id', dependent: :destroy
  has_many :passive_messages, class_name: 'Message', foreign_key: 'target_user_id', dependent: :destroy

  def favorite!(post)
    self.favorites.create!(post: post)
  end

  def unfavorite!(post)
    self.favorites.find_by(post: post).destroy!
  end

  def favorited?(post)
    self.favorites.find_by(post: post).present?
  end

  def follow!(user)
    self.active_relationships.create!(target_user: user)
  end

  def unfollow!(user)
    self.active_relationships.find_by(target_user: user).destroy!
  end

  def follow?(user)
    self.active_relationships.find_by(target_user: user).present?
  end

  def timeline_posts
    users = self.followings + [self]
    return Post.where(user: users).ordered
  end

  def self.find_for_login(value)
    self.where(provider: :email).where("lower(username) = :value OR lower(email) = :value", { :value => value.downcase }).first
  end
end
