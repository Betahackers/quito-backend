# quito-backend

## Requirements

  - PostgreSQL installed

## Getting started

The `bin/setup` script takes care of preparing your development machine:

```shell
bin/setup
```

# API Usage

### List resource objects

```
GET http://www.fromto.es/v2/{RESOURCE_NAME}.json
```

### Retrieve a specific resource

```
GET http://www.fromto.es/v2/{RESOURCE_NAME}/{RESOURCE_ID}.json
```

### Filtering resources

```
GET http://www.fromto.es/v2/{RESOURCE_NAME}.json?{FILTER_TYPE}={VALUE}

```
### Combinding filters

```
GET http://www.fromto.es/v2/{RESOURCE_NAME}.json?{FILTER_TYPE1}={VALUE1}&{FILTER_TYPE2}={VALUE2}
```

## Resources

###Users
```
GET http://www.fromto.es/v2/users.json
```
Users have the following attributes:
* id
* first_name
* last_name
* about
* profession
* nationality
* expert_in
* twitter_handle
* website_url
* articles (array of authored articles)
* locations (array of locations about which they have authored articles. will include foursquare params if include_foursquare=true)

###Articles
```
GET http://www.fromto.es/v2/articles.json
```
Articles have the following attributes:
* id
* title
* mood_list
* category_list
* content
* kind
* user (hash of the authoring users params)
* locations (array of locations belonging to article. will include foursquare params if include_foursquare=true )

###Locations
```
GET http://www.fromto.es/v2/locations.json
```

Locations have the following attributes:
* id
* name (from foursquare)
* longitude
* latitude
* articles (array of articles tagged with this location. Includes the nested user)
* foursquare (array of fields from foursquare. Excluded by default; use include_foursquare=true )


You should always include the version number when coding against the API. Removing the version number will cause it to use the latest one, which may have breaking changes.




##Filtering

The following filters are available on all resources:
* by_mood  (attribute of an Article)
* by_category (attribute of an Article)
* by_user (id of a User)
* by_article (id of an Article)
* by_location (id of a Location)
* by_lat_long {lat, long, radius(optional)} (attribute of a Location)
  * radius is in meters. default is 10 meters
  * hash of params as follows:
  ```
  v2/locations.json?by_lat_long[lat]=23.45678&by_lat_long[long]=98.765&by_lat_long[radius]=23
  ```


Note: Filters by_user, by_article, and by_location will not work on their parent resources. I.e. You cannot filter a list of users by a user id. If you want user 39, call users/39.json, not users.json?user_id=39

Filters can be mixed and matched. 

All filters, except by_lat_long, also accept an array of values. E.g. /articles.json?by_mood[]=social&by_mood[]=energetic
This query wil return articles with moods social OR energetic. 

Values passed in an array will be matched as an OR condition, whereas filters of different types are matched as an AND condition (?mood=energetic&category=food will return articles with energetic mood AND food category)

Note: attributes belong to a specific resource type. I.e. 'mood' is an attribute of an article. If you filter locations by a mood, it will show all locations with articles tagged with that mood or moods. 


