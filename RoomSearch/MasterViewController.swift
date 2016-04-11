/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import CoreLocation
var long = 0.0
var lat = 0.0

class MasterViewController: UITableViewController, CLLocationManagerDelegate {
    
    // Properties
    var detailViewController: Draw2D? = nil
    var rooms = [Room]()
    var blank = " "
    var filteredRooms = [Room]()
    let searchController = UISearchController(searchResultsController: nil)
    var locationManager: CLLocationManager!
    

    
    // View Setup
        override func viewDidLoad() {
        super.viewDidLoad()
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        // Search Controller
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        // Scope Bar
        searchController.searchBar.scopeButtonTitles = ["All", "Classroom", "Conference", "Office"]
        searchController.searchBar.delegate = self
          
//        //for test
//          rooms = [
//            Room(category:"Conference", name:"114", person:" "),
//            Room(category:"Food", name:"120", person:" "),
//            Room(category:"Office", name:"303A", person:"Balch Bradley"),
//            Room(category:"Conference", name:"322", person:" "),
//            Room(category:"Theater", name:"124", person:" "),
//            Room(category:"Classroom", name:"008R", person:" "),
//            Room(category:"Lab", name:"008O", person:" "),
//            Room(category:"Resource", name:"008K", person:" "),
//            Room(category:"Office", name:"001A", person:" "),
//            Room(category:"Base", name:"Second floor", person:" ")]
          
          
        rooms = [
            Room(category:"Classroom", name:"101", person:" "),
            Room(category:"Classroom", name:"102", person:" "),
            Room(category:"Classroom", name:"103", person:" "),
            Room(category:"Classroom", name:"107", person:" "),
            Room(category:"Classroom", name:"108", person:" "),
            Room(category:"Classroom", name:"201", person:" "),
            Room(category:"Classroom", name:"202", person:" "),
            Room(category:"Classroom", name:"203", person:" "),
            Room(category:"Classroom", name:"207", person:" "),
            Room(category:"Classroom", name:"208", person:" "),
            Room(category:"Classroom", name:"209A", person:" "),
            Room(category:"Classroom", name:"212A", person:" "),
            Room(category:"Conference", name:"110G", person:" "),
            Room(category:"Conference", name:"111", person:" "),
            Room(category:"Conference", name:"113", person:" "),
            Room(category:"Conference", name:"114", person:" "),
            Room(category:"Office", name:"Dean's office", person:" "),
            Room(category:"Food", name:"120", person:" "),
            Room(category:"Office", name:"303A", person:"Balch Bradley"),
            Room(category:"Office", name:"302A", person:"Balch Tonya"),
            Room(category:"Office", name:"303C", person:"Ball Carrie"),
            Room(category:"Office", name:"329D", person:"Bauserman Kathryn"),
            Room(category:"Office", name:"323A", person:"Boileau Tim"),
            Room(category:"Office", name:"309C", person:"Bolinger Kevin"),
            Room(category:"Office", name:"328A", person:"Burden Robin"),
            Room(category:"Office", name:"302C", person:"Clifford Kathleen"),
            Room(category:"Office", name:"314B", person:"Corey Noble"),
            Room(category:"Office", name:"326A", person:"Donlan Ryan"),
            Room(category:"Office", name:"301A", person:"Ganapathy–Coleman Hemalatha"),
            Room(category:"Office", name:"311B", person:"Hammen Vicki"),
            Room(category:"Office", name:"309D", person:"Hampton Eric"),
            Room(category:"Office", name:"310A", person:"Hess julie"),
            Room(category:"Office", name:"327C", person:"Hinshaw Rebecca"),
            Room(category:"Office", name:"321C", person:"Hinton Kandace"),
            Room(category:"Office", name:"321D", person:"Howard-Hamilton Mary"),
            Room(category:"Office", name:"311A", person:"Hubnall Faith"),
            Room(category:"Office", name:"315C", person:"Kinger Sue"),
            Room(category:"Office", name:"323C", person:"Lai Feng-Qi"),
            Room(category:"Office", name:"329A", person:"Leinenbacj Marylin"),
            Room(category:"Office", name:"310C", person:"Liu Karen"),
            Room(category:"Office", name:"301C", person:"Lutrell Lee Anne"),
            Room(category:"Office", name:"304B", person:"MacDonald Chris"),
            Room(category:"Office", name:"327B", person:"Maynard Jack"),
            Room(category:"Office", name:"317C", person:"McDaniel Terry"),
            Room(category:"Office", name:"310B", person:"McQueen Kand"),
            Room(category:"Office", name:"317D", person:"Monahan Bobbie Jo"),
            Room(category:"Office", name:"326B", person:"Nail Melissa"),
            Room(category:"Office", name:"302D", person:"Nellis Leah"),
            Room(category:"Office", name:"332B", person:"Park Yong Joon"),
            Room(category:"Office", name:"310D", person:"Roberts-Pittman Bridget"),
            Room(category:"Office", name:"309A", person:"Sailes JaDora"),
            Room(category:"Office", name:"303D", person:"Solesky Amanda"),
            Room(category:"Office", name:"315C", person:"Thacker Della"),
            Room(category:"Office", name:"323B", person:"Tinnerman Larry"),
            Room(category:"Office", name:"333C", person:"Tucker Catherine"),
            Room(category:"Office", name:"301D", person:"Viviani Anna"),
            Room(category:"Office", name:"329B", person:"Wheeler Patricia"),
            Room(category:"Office", name:"329C", person:"Whitaker Beth"),
            Room(category:"Office", name:"317B", person:"Whitaker Todd"),
            Room(category:"Office", name:"315A", person:"Woolard Cassandra"),
            Room(category:"Classroom", name:"313", person:" "),
            Room(category:"Classroom", name:"325", person:" "),
            Room(category:"Conference", name:"322", person:" "),
            Room(category:"Theater", name:"124", person:" "),
            Room(category:"Classroom", name:"008A", person:" "),
            Room(category:"Classroom", name:"008B", person:" "),
            Room(category:"Classroom", name:"008R", person:" "),
            Room(category:"Lab", name:"008O", person:" "),
            Room(category:"Lab", name:"009P", person:" "),
            Room(category:"Lab", name:"008Q", person:" "),
            Room(category:"Resource", name:"008H", person:" "),
            Room(category:"Resource", name:"008K", person:" "),
            Room(category:"Office", name:"001A", person:" "),
            Room(category:"Office", name:"001D", person:" "),
            Room(category:"Office", name:"001E", person:" "),
            Room(category:"Office", name:"001F", person:" "),
            Room(category:"Office", name:"001G", person:" "),
            Room(category:"Office", name:"001H", person:" "),
            Room(category:"Office", name:"001I", person:" "),
            Room(category:"Office", name:"001J", person:" "),
            Room(category:"Office", name:"001K", person:" "),
            Room(category:"Office", name:"001L", person:" "),
            Room(category:"Office", name:"001M", person:" "),
            Room(category:"Office", name:"001N", person:" "),
            Room(category:"Office", name:"001O", person:" "),
            Room(category:"Office", name:"001P", person:" "),
            Room(category:"Office", name:"001Q", person:" "),
            Room(category:"Office", name:"001T", person:" "),
            Room(category:"Office", name:"001U", person:" "),
            Room(category:"Office", name:"009",  person:" "),
            Room(category:"Office", name:"008I", person:" "),
            Room(category:"Office", name:"008J", person:" "),
            Room(category:"Office", name:"008K", person:" "),
            Room(category:"Office", name:"008L", person:" "),
            Room(category:"Office", name:"008M", person:" "),
            Room(category:"Office", name:"008N", person:" "),
            Room(category:"Base", name:"Second floor", person:" "),
            Room(category:"Base", name:"Third floor", person:" "),
            Room(category:"Base", name:"Garden level", person:" "),
            Room(category:"Base", name:"First floor", person:" ")]
        
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? Draw2D
        }
    }
    
    //CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location:CLLocation = locations[0] as CLLocation
        // print("latitude:\(location.coordinate.latitude)")
        // print("longitude\(location.coordinate.longitude)")
        long =  location.coordinate.longitude
        lat =  location.coordinate.latitude
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        // print("Error while updating location" + error.localizedDescription)
    }
    
    func locationManagerDidPauseLocationUpdates(manager: CLLocationManager) {
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Table View
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active {
            return filteredRooms.count
        }
        return rooms.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let room: Room
        if searchController.active {
            room = filteredRooms[indexPath.row]
        } else {
            room = rooms[indexPath.row]
        }
        cell.textLabel!.text = room.name + blank + room.person
        cell.detailTextLabel!.text = room.category
        return cell
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredRooms = rooms.filter({( room : Room) -> Bool in
          let categoryMatch = ((scope == "All") || (room.category == scope))
          
          if categoryMatch {
            
            let roomNameContains = room.name.lowercaseString.containsString(searchText.lowercaseString) || searchText == ""
            let roomPersonContains = room.person.lowercaseString.containsString(searchText.lowercaseString) || searchText == ""
            
            let result =  roomNameContains || roomPersonContains
            
            if result {
              print("add room");
              
            }else {

            }
            
            return result;
          }else {
            return false;
          }
        })
        tableView.reloadData()
    }
    
    // Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let room: Room
                if searchController.active {
                    room = filteredRooms[indexPath.row]
                } else {
                    room = rooms[indexPath.row]
                }
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! Draw2D
                controller.detailRoom = room
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
}

extension MasterViewController: UISearchBarDelegate {
    // UISearchBar Delegate
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension MasterViewController: UISearchResultsUpdating {
    // UISearchResultsUpdating Delegate
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}