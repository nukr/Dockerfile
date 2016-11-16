#!/bin/bash
set -e

if [ -z $POSTGRES_PASSWORD ]
then
    POSTGRES_PASSWORD='secret'
fi

# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<EOF
# CREATE DATABASE groupbuy;
# \connect groupbuy;
# CREATE TABLE IF NOT EXISTS "user" (
#   "id" uuid,
#   "name" varchar(50) NOT NULL,
#   CONSTRAINT pk_user_id PRIMARY KEY (id)
# );

# CREATE TABLE IF NOT EXISTS "group" (
#   "id" uuid,
#   "title" varchar(50) NOT NULL,
#   "description" varchar(50),
#   "owner_id" uuid NOT NULL,
#   CONSTRAINT pk_group_id PRIMARY KEY (id),
#   CONSTRAINT fk_group_owner_id FOREIGN KEY (owner_id)
#     REFERENCES "user" (id)
# );

# CREATE TABLE IF NOT EXISTS "participant" (
#   "user_id" uuid NOT NULL,
#   "group_id" uuid NOT NULL,
#   CONSTRAINT fk_participant_user_id FOREIGN KEY (user_id)
#     REFERENCES "user" (id),
#   CONSTRAINT fk_participant_group_id FOREIGN KEY (group_id)
#     REFERENCES "group" (id),
#   CONSTRAINT pk_participant PRIMARY KEY (user_id, group_id)
# );
# EOF

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<EOF
CREATE DATABASE steakhouse;
\connect steakhouse;
CREATE TABLE IF NOT EXISTS "dish" (
  "id" uuid PRIMARY KEY,
  "name" varchar(50) NOT NULL,
  "description" varchar(50),
  "price" real NOT NULL
);

CREATE TABLE IF NOT EXISTS "menu" (
  "id" uuid PRIMARY KEY,
  "name" text NOT NULL,
  "description" text,
  "dishes" uuid ARRAY
);
EOF
