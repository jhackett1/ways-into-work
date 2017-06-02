class Client < ApplicationRecord
  # associations
  has_one :login, class_name: UserLogin.to_s, as: :user, dependent: :destroy

  validates :login, :first_name, :last_name, :phone, :address_line_1, :postcode, presence: true

  delegate :email, to: :login

  accepts_nested_attributes_for :login

  validate do
    valid_postcode? && within_hackney?
  end

  phony_normalize :phone, default_country_code: 'GB'
  validates_plausible_phone :phone, country_code: 'GB'

  def name
   "#{first_name} #{last_name}"
  end

  def within_hackney?
    # TODo - move this back outside of validation
    eligible = HackneyPostcodeValidator.new(self.postcode).within_hackney?
    errors[:postcode] << I18n.t('clients.validation.outside_borough') unless eligible
    eligible
  end

  def valid_postcode?
    return false if self.postcode.blank?
    if better_postcode = GoingPostal.postcode?(postcode, 'GB')
      self.postcode = better_postcode
    else
      errors[:postcode] << I18n.t('clients.validation.postcode_error')
    end
    errors[:postcode].empty?
  end

  def profile_complete?
    employment_status.present?
  end

  def devise_mailer
    CustomDeviseMailer
  end

end
