class PersonalTraitOption
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def self.all
    [
      new('creative', I18n.t('clients.personal_trait.creative')),
      new('active', I18n.t('clients.personal_trait.active')),
      new('caring', I18n.t('clients.personal_trait.caring')),
      new('organised', I18n.t('clients.personal_trait.organised')),
      new('problem_solver', I18n.t('clients.personal_trait.problem_solver')),
      new('people_person', I18n.t('clients.personal_trait.people_person')),
      new('persuasive', I18n.t('clients.personal_trait.persuasive')),
      new('good_listener', I18n.t('clients.personal_trait.good_listener')),
      new('outgoing', I18n.t('clients.personal_trait.outgoing'))
    ]
  end

  def self.find(id)
    all.detect{|x| x.id == id}
  end

  def self.display(ids = [])
    ids.collect{|id| find(id).name}.join(', ')
  end

end


