# SwiftNews
## Instructions:
* Clone this repository
* Open a terminal window in your new downloaded directory
* Type **pod install**
* Run the project in Xcode
* Enjoy

##Features
* Pulls JSON data from the following: https://www.reddit.com/r/swift/.json
* Displays decoded data 
* Display selected article 
* Network reachability listener
* Pull to refreshe data

##Justification:
- The application supports iOS 12.x
- Built using MVVM Design patterns for single responisbilty.
- I use Alamofire to handle device network rechability error and i display an apporprity message to the UI. Alamofire because its a well tested and documented framework, it would support extendabilty of the project.
- The main view uses "NewsHomeViewController" uses a tableview to display the list of article, I used a tableview for a few reasons: 
    - A tableview allows designing reusable cells incase we want to add more funtionality for each cell.
    - I used a tableView because the height of each cell are dynamic, tableview delegates allows be to calculate the height of each cell.
    - TableView cells loads content when they are needed, preserve memory resource.
