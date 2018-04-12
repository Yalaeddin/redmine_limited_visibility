require_dependency 'projects_helper'

module PluginLimitedVisibility

  module ProjectsHelper

    def project_settings_tabs
      tabs = super
      available_functions = {name: 'functional_roles', action: :functional_roles, partial: 'projects/settings_functional_roles_tab', label: :label_functional_roles}
      tabs << available_functions if ( User.current.admin? || User.current.allowed_to?(:manage_functional_roles_by_project, @project) )
      tabs
    end

  end

end

ProjectsHelper.prepend PluginLimitedVisibility::ProjectsHelper
ActionView::Base.send(:include, ProjectsHelper)
