# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

app_user を以下の手順で作成

```
$ bin/rails dbconsole
psql (14.18 (Homebrew))
Type "help" for help.

multi_tenant_example_rails804_development=# CREATE ROLE app_user LOGIN PASSWORD 'password';
CREATE ROLE
multi_tenant_example_rails804_development=# GRANT CONNECT ON DATABASE multi_tenant_example_rails804_development TO app_user;
GRANT
multi_tenant_example_rails804_development=# GRANT USAGE ON SCHEMA public TO app_user;
GRANT
multi_tenant_example_rails804_development=# GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO app_user;
GRANT
multi_tenant_example_rails804_development=# GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO app_user;
GRANT
multi_tenant_example_rails804_development=# ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app_user;
ALTER DEFAULT PRIVILEGES
multi_tenant_example_rails804_development=# ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT USAGE, SELECT ON SEQUENCES TO app_user;
ALTER DEFAULT PRIVILEGES
multi_tenant_example_rails804_development=# \du app_user
           List of roles
 Role name | Attributes | Member of
-----------+------------+-----------
 app_user  |            | {}

multi_tenant_example_rails804_development=# \dp users
                                   Access privileges
 Schema | Name  | Type  |       Access privileges       | Column privileges | Policies
--------+-------+-------+-------------------------------+-------------------+----------
 public | users | table | ttanimichi=arwdDxt/ttanimichi+|                   |
        |       |       | app_user=arwd/ttanimichi      |                   |
(1 row)

multi_tenant_example_rails804_development=# exit
```

```
$ psql -U ttanimichi -d multi_tenant_example_rails804_development
psql (14.18 (Homebrew))
Type "help" for help.

multi_tenant_example_rails804_development=# GRANT SELECT, INSERT, UPDATE, DELETE ON schema_migrations TO app_user;
GRANT
multi_tenant_example_rails804_development=# GRANT SELECT, INSERT, UPDATE, DELETE ON ar_internal_metadata TO app_user;
GRANT
multi_tenant_example_rails804_development=# \dp schema_migrations
                                         Access privileges
 Schema |       Name        | Type  |       Access privileges       | Column privileges | Policies
--------+-------------------+-------+-------------------------------+-------------------+----------
 public | schema_migrations | table | ttanimichi=arwdDxt/ttanimichi+|                   |
        |                   |       | app_user=arwd/ttanimichi      |                   |
(1 row)

multi_tenant_example_rails804_development=# \dp ar_internal_metadata
                                          Access privileges
 Schema |         Name         | Type  |       Access privileges       | Column privileges | Policies
--------+----------------------+-------+-------------------------------+-------------------+----------
 public | ar_internal_metadata | table | ttanimichi=arwdDxt/ttanimichi+|                   |
        |                      |       | app_user=arwd/ttanimichi      |                   |
(1 row)

multi_tenant_example_rails804_development=#
```
