# Log files parser
A `Parser` class that takes as argument a `.log` file in format `[path] [ip]` and counts every unique visit.

### Demo:
1. Clone this repo
2. Run in the console: `bundle install`
3. Run the command: `ruby ./parser_script.rb webserver.log`

### What will happen?
1. Every new log will be printed out with its specific nature:
 - New page view
 - New view on an existing page
 - Duplicated view
2. A breakdown with all the pages visited with how many views it received order in view count descending order