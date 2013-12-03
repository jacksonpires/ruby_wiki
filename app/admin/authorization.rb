class Admin::Authorization < ActiveAdmin::AuthorizationAdapter
  def authorized?(action, subject = nil)
    case action
      when :create  then can_manage_wiki_detail?(subject)
      when :destroy then can_manage_wiki_detail?(subject)
      when :update  then true
      when :read    then true
    end
  end

  def can_manage_wiki_detail?(subject)
    !subject.is_a?(WikiDetail)
  end
end
