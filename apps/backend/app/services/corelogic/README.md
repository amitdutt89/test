# Corelogic APIs

## Prequisites

Set the following environment variables
```
CORELOGIC_CONSUMER_KEY
CORELOGIC_CONSUMER_SECRET
```

## API Integration

### Property Search

To use property search, run the following in rails console
```ruby
property_search = { "streetAddress": "1414 Harbor Way S", "state": "CA", "zipCode": "94804"}
Corelogic::PropertySearch.new.fetch(property_search)
```

### Property Details

To use property details, run the following in rails console
```ruby
clip_ids = ["5165909850"]
Corelogic::PropertyDetail.new.fetch(clip_ids)
```
