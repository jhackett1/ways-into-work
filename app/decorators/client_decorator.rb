class ClientDecorator < Draper::Decorator

  delegate_all

  decorates :client

  def client_profile_header
    'Your Profile'
  end

  def decorate_email
    standard_wrapper('Email account:', client.email)
  end

  def decorate_phone
    standard_wrapper("Phone number:", client.phone)
  end

  def decorate_address
    standard_wrapper("Address:", client.address_to_s)
  end

  def decorate_age
    standard_wrapper("Age:", client.age_in_years.to_s)
  end

  def decorate_personal_traits
    standard_wrapper("Strengths:", PersonalTraitOption.display(client.personal_traits))
  end

  def decorate_other_personal_trait
    standard_wrapper("Other:", client.other_personal_trait)
  end

  def decorate_objectives
    standard_wrapper("Objectives:", ObjectiveOption.display(client.objectives))
  end

  def decorate_other_objective
    standard_wrapper("Other:", client.other_objective)
  end

  def decorate_studying
    standard_wrapper("Currently studying:", value_from(client.studying))
  end

  def decorate_current_education
    standard_wrapper("Current education course title:", client.current_education )
  end

  def decorate_past_education
    standard_wrapper("Past education:", client.past_education)
  end

  def decorate_currently_employed
    standard_wrapper("Currently employed:", value_from(client.employed))
  end

  def decorate_job_title
    standard_wrapper("Job title:", client.job_title)
  end

  def decorate_hours_per_week
    standard_wrapper("Hours per week:", client.working_hours_per_week)
  end

  def decorate_time_since_last_job
    standard_wrapper("Months since last job:", client.time_since_last_job)
  end


  def value_from(boolean)
    case boolean
    when true
      'Yes'
    when false
      'No'
    else
      'Unknown'
    end
  end

  def standard_wrapper(label, value)
    if value.present?
      h.content_tag(:p, '') do
        h.content_tag(:label, label, class: 'label') <<
        value
      end
    end
  end

end