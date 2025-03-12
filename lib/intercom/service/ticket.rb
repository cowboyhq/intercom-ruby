require 'intercom/service/base_service'
require 'intercom/api_operations/find'
require 'intercom/api_operations/save'
require 'intercom/api_operations/search'

module Intercom
  module Service
    class Ticket < BaseService
      include ApiOperations::Find
      include ApiOperations::Save
      include ApiOperations::Search

      def collection_class
        Intercom::Ticket
      end

      def reply(id, params)
        response = @client.post("/tickets/#{id}/reply", params)
        from_api(response)
      end
    end
  end
end
