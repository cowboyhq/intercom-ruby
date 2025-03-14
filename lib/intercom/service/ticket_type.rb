require 'intercom/service/base_service'
require 'intercom/api_operations/list'
require 'intercom/api_operations/find'
require 'intercom/api_operations/save'

module Intercom
  module Service
    class TicketType < BaseService
      include ApiOperations::List
      include ApiOperations::Find
      include ApiOperations::Save

      def collection_class
        Intercom::TicketType
      end
    end
  end
end
