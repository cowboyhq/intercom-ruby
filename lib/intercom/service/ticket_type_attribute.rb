require 'intercom/service/base_service'
require 'intercom/api_operations/save'

module Intercom
  module Service
    class TicketTypeAttribute < BaseService
      include ApiOperations::Save

      def collection_class
        Intercom::TicketTypeAttribute
      end

      def create(ticket_type_id, params)
        path = "/ticket_types/#{ticket_type_id}/attributes"
        response = @client.post(path, params)
        from_api(response)
      end

      def update(ticket_type_id, id, params)
        path = "/ticket_types/#{ticket_type_id}/attributes/#{id}"
        response = @client.put(path, params)
        from_api(response)
      end
    end
  end
end
