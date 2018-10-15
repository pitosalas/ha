# Home Automation

## Hue

### Documentation
* https://www.developers.meethue.com/documentation/getting-started

Get "username" (which is a long hex string) from the bridge using instructions above.

### Notes

* Send the following HTTP requests to the ip address of the bridge

````
GET /api/username/lights
````

##### Discover IP address
https://discovery.meethue.com -> [{"id":"001788fffe71c27d","internalipaddress":"10.0.0.89"}]