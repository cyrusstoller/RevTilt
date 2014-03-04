# == Schema Information
# Schema version: 20130424193539
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  authentication_token   :string(255)
#  username               :string(255)      default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  # attr_accessible :login
  attr_accessor :login
  
  # Validations
  validates_presence_of :username
  validates_uniqueness_of :username, :case_sensitive => false
  validates_format_of :username, :with => /\A[\w]+\z/, :on => :create, :message => "cannot have whitespace"
  
  # Database Relationships
  has_many :organization_user_relationships, :class_name => "Relationships::OrganizationUser", :foreign_key => "user_id", :dependent => :destroy
  has_many :favorite_organizations, :through => :organization_user_relationships, :source => :organization
  
  # Instance Methods
  def favorite!(organization)
    self.favorite_organizations += [organization]
    return organization
  end
  
  def unfavorite!(organization)
    self.favorite_organizations -= [organization]
    return organization
  end
  
  def favorited?(organization)
    Relationships::OrganizationUser.where(:organization_id => organization.id, :user_id => self.id).first
  end
  
  protected
  
  # Allowing for devise to use either the username or email as the authentication key
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
