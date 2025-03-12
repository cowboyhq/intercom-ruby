require 'intercom'

# Initialize the Intercom client with your access token
intercom = Intercom::Client.new(token: 'your_access_token')

# Example 1: List all ticket types
ticket_types = intercom.ticket_types.all
puts "All ticket types:"
ticket_types.each do |ticket_type|
  puts "ID: #{ticket_type.id}, Name: #{ticket_type.name}, Description: #{ticket_type.description}"
end

# Example 2: Create a new ticket type
new_ticket_type = intercom.ticket_types.create(
  name: "Bug Report",
  description: "Used for tracking bugs",
  icon: "🐞"
)
puts "\nCreated new ticket type:"
puts "ID: #{new_ticket_type.id}, Name: #{new_ticket_type.name}"

# Example 3: Retrieve a specific ticket type
ticket_type = intercom.ticket_types.find(id: new_ticket_type.id)
puts "\nRetrieved ticket type:"
puts "ID: #{ticket_type.id}, Name: #{ticket_type.name}, Description: #{ticket_type.description}"

# Example 4: Update a ticket type
updated_ticket_type = intercom.ticket_types.save(
  id: ticket_type.id,
  name: "Critical Bug Report",
  description: "Used for tracking critical bugs",
  icon: "🔥"
)
puts "\nUpdated ticket type:"
puts "ID: #{updated_ticket_type.id}, Name: #{updated_ticket_type.name}, Description: #{updated_ticket_type.description}"

# Example 5: Create a new attribute for a ticket type
new_attribute = intercom.ticket_type_attributes.create(
  ticket_type.id,
  {
    name: "Bug Priority",
    description: "Priority level of the bug",
    data_type: "list",
    required_to_create: true,
    visible_on_create: true,
    list_items: "Low Priority,Medium Priority,High Priority"
  }
)
puts "\nCreated new ticket type attribute:"
puts "ID: #{new_attribute.id}, Name: #{new_attribute.name}, Type: #{new_attribute.data_type}"

# Example 6: Update an existing attribute for a ticket type
updated_attribute = intercom.ticket_type_attributes.update(
  ticket_type.id,
  new_attribute.id,
  {
    description: "Updated priority level of the bug",
    required_to_create: false
  }
)
puts "\nUpdated ticket type attribute:"
puts "ID: #{updated_attribute.id}, Name: #{updated_attribute.name}, Description: #{updated_attribute.description}"

# Example 7: Create a ticket with the ticket type
new_ticket = intercom.tickets.create(
  {
    ticket_type_id: ticket_type.id,
    contacts: [{ id: "existing_contact_id" }],
    ticket_attributes: {
      "_default_title_": "Critical login issue",
      "_default_description_": "Users cannot log in after the latest update",
      # Assuming the attribute ID for "Bug Priority" is known
      "Bug Priority": "High Priority"
    }
  }
)
puts "\nCreated new ticket:"
puts "ID: #{new_ticket.id}, State: #{new_ticket.ticket_state}"

# Example 8: Update a ticket
updated_ticket = intercom.tickets.update(
  new_ticket.id,
  {
    state: "in_progress",
    ticket_attributes: {
      "_default_title_": "Critical login issue - In Progress",
    }
  }
)
puts "\nUpdated ticket:"
puts "ID: #{updated_ticket.id}, State: #{updated_ticket.ticket_state}"

# Example 9: Add a reply to a ticket
reply = intercom.tickets.reply(
  new_ticket.id,
  {
    message_type: "note",
    admin_id: "admin_id",
    body: "<p>Working on this issue. Will update soon.</p>"
  }
)
puts "\nAdded reply to ticket:"
puts "Reply ID: #{reply.id}, Type: #{reply.part_type}"
