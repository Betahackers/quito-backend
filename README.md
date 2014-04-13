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
http://www.fromto.es/v1/articles.json
```

### Get an Article

```
http://www.fromto.es/v1/articles/{ARTICLE_ID}.json
```

### Filtering Articles

A number of filtering options are available, and can be used in combination with
each other.  Specifying more than 1 filter will narrow the search to all
articles that satisfy all filters.

Filter by author id
```
http://www.fromto.es/v1/articles.json?author_id={AUTHOR_ID}
```

Filter by mood
```
http://www.fromto.es/v1/articles.json?mood={MOOD}
```

Filter by category
```
http://www.fromto.es/v1/articles.json?category={CATEGORY}
```
