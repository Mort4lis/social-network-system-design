# Social network System Design

This repository describes the system design of social network
within [the course](https://balun.courses/courses/system_design).

## Requirements

Our system should meet the following requirements:

### Functional requirements

- Add and delete friends
- View user's friends
- View user's profile
- Publish posts
- View feed of posts (home and user feed)
- Upload media files for posts
- Send and read messages in one-on-one and group chats
- View one-on-one and group chats

### Non-functional requirements

- 50 000 000 DAU
- Availability 99.99% (52.56 minutes downtime per year)
- The system should be scalable and efficient
- Each user sends 2 posts average per day
- Each user reads 10 posts average per day
- The size of each post is a maximum of 5000 characters
- The size of each media files is a maximum 1MB
- 10% of posts contain media files
- Each post has a maximum 3 media files
- A message should reach the recipient in 3 seconds
- Each user sends 20 messages average per day
- Each user reads 100 messages average per day
- The size of each message is a maximum of 1000 characters
- A group can have a maximum of 100 participants
- Geo distribution is not supported (CIS only)
- No seasonality