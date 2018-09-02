class CatalogClient::Category
  include ActiveModel::Model

  KNOWN_ATTRIBUTES = %i[
    name
    code
    store_id
  ].freeze

  attr_accessor(*KNOWN_ATTRIBUTES)

  def initialize(attrs = {})
    super(attrs.select { |(k, v)| KNOWN_ATTRIBUTES.include?(k.to_sym) })
  end

  def persisted?
    true
  end
end
