class User::Manager::FactoryManager < User::Manager
  belongs_to :factory, class_name: 'Factory'
end
