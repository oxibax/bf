class Goal < ApplicationRecord
    enum priority: [ :low, :medium, :high ]
end
