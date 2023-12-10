// Replication:
// - master-slave (async)
// - replication factor 3

enum chat_type {
  group
  conversation
}

// Sharding:
// - key based by id

Table chats {
  id integer [primary key]
  name varchar [not null]
  type chat_type [not null]
  created_at timestamp [default: `now()`]
}

// Sharding:
// - key based by chat_id

Table participants {
  id integer [primary key]
  chat_id integer [not null]
  user_id integer [not null] // Ref: users.id (profiles_and_relations.io)
}

Ref: participants.chat_id > chats.id

// Sharding:
// - key based by chat_id
// - range based by sent_at (per 1 month)

Table messages {
  id integer [primary key]
  chat_id integer [not null]
  sender_id integer [not null] // Ref: users.id (profiles_and_relations.io)
  text varchar [not null]
  sent_at timestamp [not null]
  delivered_at timestamp
  seen_at timestamp
}

Ref: messages.chat_id > chats.id

