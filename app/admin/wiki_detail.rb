ActiveAdmin.register WikiDetail do
  actions :all, :except => [:new]

  controller do
    def permitted_params
      params.permit wiki_detail: [
        :name,
        :initial_page_id,
        :logo
      ]
    end
  end

  index do
    column :name
    column('Initial Page') { |wiki_detail| wiki_detail.initial_page.title if wiki_detail.initial_page }
    default_actions
  end

  show do |wiki|
    attributes_table do
      row :initial_page
      row(:logo) { image_tag(wiki.logo.url) }
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :initial_page_id, as: :select, collection: Page.all
      f.input :logo, as: :file, label: 'Logo'
    end

    f.actions
  end
end
