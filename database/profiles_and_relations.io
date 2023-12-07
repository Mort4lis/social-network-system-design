// Replication:
// - master-slave (async)
// - replication factor 3

Table cities {
  id integer [primary key]
  name varchar [not null, unique]
}

Table interests {
  id integer [primary key]
  name varchar [not null]
}

// Sharding:
// - key based by user_id

Table interests_profiles {
  interest_id integer [not null]
  profile_id integer [not null]
  user_id integer [not null]
  
  indexes {
    (interest_id, profile_id) [pk]
  }
}

Ref: interests_profiles.interest_id > interests.id
Ref: interests_profiles.profile_id > profiles.id
Ref: interests_profiles.user_id > users.id

// Sharding:
// - key based by id

Table users {
  id integer [primary key]
  username varchar [not null, unique]
  email varchar [not null, unique]
  pwd_hash varchar [not null]
  created_at timestamp [default: `now()`]
}

// Sharding:
// - key based by user_id

Table profiles {
  id integer [primary key]
  user_id integer [not null]
  first_name varchar [not null]
  last_name varchar [not null]
  description varchar
  photo_id integer // Ref: media.id (media.io)
  city_id integer
  created_at timestamp [default: `now()`]
}

Ref: profiles.user_id - users.id
Ref: profiles.city_id > cities.id

enum relation_type {
  subscriber
  friend
  love
}

// Sharding:
// - key based by src_user_id

Table relations {
  id integer [primary key]
  src_user_id integer [not null]
  dst_user_id integer [not null]
  type relation_type [not null]
  created_at timestamp [default: `now()`]
}

Ref: relations.src_user_id > users.id
Ref: relations.dst_user_id > users.id

