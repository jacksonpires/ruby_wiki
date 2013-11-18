ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: 'Dashboard'

  content title: 'Dashboard' do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        span 'Welcome'
      end
    end
  end
end
