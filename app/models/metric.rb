class Metric
  include Mongoid::Document
  field :successful, type: Integer
  field :failed, type: Integer
  field :remaining, type: Integer
  field :converted, type: Integer
  field :queued_at, type: Integer
  field :contents, type: Hash
  field :api_id, type: String
  field :auth_id, type: String
  field :app_id, type: String
end
