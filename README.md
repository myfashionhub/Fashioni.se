## Fashioni.se

A bookmarking tool for discovering and keeping track of your coveted fashion items.
Fashioni.se customizes search results based on your declared style and lets you filter items by price, popularity and/or recency. Peak inside other fashionistas' closets and steal their style. **[View app](http://fashionize.herokuapp.com/)**

![Fashioni.se homepage](http://www.nessanguyen.com/images/portfolio-fashionize.png "Fashioni.se homepage")

### Getting started
- Clone the repository, `bundle install`
- Set up the database: `bin/rake db:create db:migrate`
- Seed the database with styles: `rake db:seed`
- Obtain a Shopstyle API key and set it in your bash/env
```
SHOPSTYLE_ID=[API KEY]
```

### Shopstyle API
Fashioni.se utilizes the [Shopstyle API](http://shopsense.shopstyle.com/shopsense/28044754, "Shopstyle API"), a fashion product search engine, to bring customized results.   

It customizes fashionista's search results by passing filter params into the query string, determined by the fashionista's stated style (men's or women's wear, relevant retailers, clothing size) and/or the params they choose at the search (price range, sort by). 
