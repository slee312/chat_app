class Clowd
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :edit, type: Time
  field :approvals, type: Integer
  field :flags, type: Integer
  field :status, type: Integer
  field :icon, type: String
end
