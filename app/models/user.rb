class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :recoverable and :omniauthable

  # removed recoverable to avoid having to send emails while building and testing more base fuctionality. IMPORTANT MUST REVIST THIS BEFORE FINAL BUILD

  devise :database_authenticatable, :registerable, :rememberable, :validatable
end
