class Opportunity < ApplicationRecord
  actable

  validates :title, presence: true
  validates :closing_date, presence: true
  validates :short_description, presence: true
  validates :location, presence: true

  scope :active, -> { where('closing_date >= ?', Date.today).order(:closing_date) }
  scope :inactive, -> { where('closing_date < ?', Date.today).order(:closing_date) }

  has_many :enquiries

  def type_string
    case self.actable_type
    when 'Job'
      'Job'
    when 'ExternalApprenticeship'
      'Apprenticeship'
    when 'WorkPlacement'
      'Placement'
    end
  end

  def enquired_for_by_client? client
    return nil if client.nil?
    if enquiries.where(client_id: client.id).count > 0
      true
    else
      false
    end
  end

end
