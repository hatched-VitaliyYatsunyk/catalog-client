require 'faraday'
require 'json'

module CatalogClient
  class Wrapper
    # Do not want to add ActiveSupport and Inflector for plurals support
    CATALOG_OBJECTS = {
      store:    'stores',
      category: 'categories',
      product:  'products'
    }

    def initialize(service_url) # Potentially a place to include caching and authorization
      @conn = Faraday.new(url: service_url)
    end

    # Getters
    CATALOG_OBJECTS.keys.each do |name|
      # Get one item
      define_method(name) do |id|
        begin
          response = @conn.get("/#{CATALOG_OBJECTS[name]}/#{id}")
          class_from_name(name.to_s).new(JSON.parse(response.body, symbolize_names: true))
        rescue Faraday::ResourceNotFound
          nil
        end
      end

      # Get collection
      define_method(CATALOG_OBJECTS[name]) do
        begin
          response = @conn.get("/#{CATALOG_OBJECTS[name]}")
          klass = class_from_name(name.to_s)
          JSON.parse(response.body, symbolize_names: true)
              .map{ |item| klass.new(item) }
        rescue Faraday::ResourceNotFound
          nil
        end
      end

      # TODO: Add Create, Update, Delete if needed to expose for the client
    end

    private

    def class_from_name(name)
      CatalogClient.const_get(name.capitalize)
    end

  end
end
