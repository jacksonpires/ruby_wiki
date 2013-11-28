module AcceptanceMacros
  def find_or_create_a_wiki_detail
    WikiDetail.where(name: 'Test Wiki').first_or_create
  end
end
