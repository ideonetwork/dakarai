# Ideo Rails generator

Official code generator for Rails projects.

## Basic Commands

### Initializer

To initialize your project with initial files run:

```console
rails generate ideo_rails:initializer ApplicationName
```

Possible options are:

- **dev** : generate project initializations for ideo_rails development purpose.

## Evnt Commands

Commads used with Evnt gem (https://github.com/ideonetwork/ruby-evnt)

### Initializer

To initialize your project to support Evnt gem run:

```console
rails generate ideo_rails:evnt_initializer
```

Possible options are:

- **no-migrations** : avoid the generation of Event migration.

### Authentication

To add all you need to manage users authentication run:

```console
rails generate ideo_rails:evnt_authentication
```

Possible options are:

- **no-migrations** : avoid the generation of User and UserPassword migrations.