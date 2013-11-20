class VersionService
  def initialize(page)
    @page = page
  end

  def versions
    @page.versions.map do |version|
      page_hash = {}
      page_hash[:user] = User.find(version.whodunnit) if version.whodunnit
      page_hash.merge!(YAML.load(version.object)) if version.object
      page_hash
    end
  end
end
