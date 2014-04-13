# quito-backend

## Requirements

  - PostgreSQL installed

## Getting started

The `bin/setup` script takes care of preparing your develompment machine:

```shell
bin/setup
```

# API Usage

## Articles

### List All Articles

```
GET http://www.fromto.es/v1/articles.json
```

### Retrieve an Article

```
GET http://www.fromto.es/v1/articles/{ARTICLE_ID}.json
```

### Filtering Articles

A number of filtering options are available, and can be used in combination with
each other.  Specifying more than 1 filter will narrow the search to all
articles that satisfy all filters.

Filter by author id
```
GET http://www.fromto.es/v1/articles.json?author_id={AUTHOR_ID}
```

Filter by mood
```
GET http://www.fromto.es/v1/articles.json?mood={MOOD}
```

Filter by category
```
GET http://www.fromto.es/v1/articles.json?category={CATEGORY}
```

## Users


### List All Users

```
GET http://www.fromto.es/v1/users.json
```

### Retrieve a User

```
GET http://www.fromto.es/v1/users/{USER_ID}.json
```


## Locations

### List All Locations

```
GET http://www.fromto.es/v1/locations.json
```

### Filter Locations by 
