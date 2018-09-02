class CatalogClient::Product
  include ActiveModel::Model

  KNOWN_ATTRIBUTES = %i[
    name
    description
    sku
    vendor
    category_id
  ].freeze

  attr_accessor(*KNOWN_ATTRIBUTES)

  def initialize(attrs = {})
    super(attrs.select { |(k, v)| KNOWN_ATTRIBUTES.include?(k.to_sym) })
  end

  def persisted?
    true
  end
end
