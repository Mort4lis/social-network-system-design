// Replication:
// - master-slave (async)
// - replication factor 3
//
// Sharding:
// - key based by chat_id

Table messages {
  chat_id integer [primary key]
  messages list
}