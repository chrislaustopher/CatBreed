# New Relic Code Challenge

## Primary Assumptions
* Project need only contain 1 API endpoint (http call to "/breeds")
* Cat breed details can have default value of "unknown" if no value exists from response data
* Metric data resets to 0 whenever app starts up, and does not need to persist over multiple sessions
* The next batch of data for cat breeds (30 at a time) is fetched when scrolled to end of list
* If data is modified from the cat breeds API, the app need not update in real-time accordingly

