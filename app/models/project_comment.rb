class ProjectComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :project_post
end