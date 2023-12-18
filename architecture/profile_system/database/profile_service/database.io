// Replication:
// - master-slave (async)
// - replication factor 2

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

// Sharding:
// - key based by user_id

Table profiles {
  id integer [primary key]
  user_id integer [not null]
  first_name varchar [not null]
  last_name varchar [not null]
  description varchar
  photo_link varchar
  city_id integer
  created_at timestamp [default: `now()`]
}

Ref: profiles.city_id > cities.id