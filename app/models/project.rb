class Project < ApplicationRecord
    validates :name, presence: true
    belongs_to :group
    scope :ordered, -> { order(id: :desc) }
    broadcasts_to ->(project) {[project.group, "projects"] }, inserts_by: :prepend
end
