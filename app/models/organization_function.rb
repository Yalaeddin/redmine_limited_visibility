class OrganizationFunction < ActiveRecord::Base
  belongs_to :project
  belongs_to :organization
  belongs_to :function
  validates_uniqueness_of :function_id, scope: [:project_id, :organization_id]
  validates_presence_of :function_id, :project_id, :organization_id
end
