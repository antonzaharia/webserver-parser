# Log files parser

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