class ApplicationDecorator < Draper::Decorator
  delegate_all

  delegate :to_s, to: :model
end
