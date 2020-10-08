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
* Pull to refresh data

##Justification:
- The application supports iOS 12.x
- Built using MVVM Design patterns for single responsibility.
- I use Alamofire to handle device network reachability error and I display an appropriate message to the UI. Alamofire because its a well-tested and documented    framework, would support the extendibility of the project.
- The main view uses "NewsHomeViewController" uses a table view to display the list of article, I used a table view for a few reasons:
   -   A table view allows for designing reusable cells in case we want to add more functionality for each cell.
   -   I used a tableView because the height of each cell is dynamic, table view delegates allows calculating the height of each cell.
   -  TableView cells loads content when they are needed, preserve memory resources.
