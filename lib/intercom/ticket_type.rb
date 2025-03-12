require 'intercom/traits/api_resource'
require 'intercom/api_operations/nested_resource'

module Intercom
  class TicketType
    include Traits::ApiResource
    include ApiOperations::NestedResource

    nested_resource_methods :attribute, 
                           path: 'attributes',
                           operations: %i[create list],
                           resource_plural: 'attributes'

    def self.collection_proxy_class
      Intercom::ClientCollectionProxy
    end

    def identity_vars ; [:id] ; end
  end
end
