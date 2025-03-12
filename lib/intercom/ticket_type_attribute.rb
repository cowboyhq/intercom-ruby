require 'intercom/traits/api_resource'

module Intercom
  class TicketTypeAttribute
    include Traits::ApiResource

    def self.collection_proxy_class
      Intercom::ClientCollectionProxy
    end

    def identity_vars ; [:id] ; end
  end
end
