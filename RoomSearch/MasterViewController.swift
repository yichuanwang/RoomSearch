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

class MasterViewController: UITableViewController {
    
    // Properties
    var detailViewController: DetailViewController? = nil
    var rooms = [Room]()
    var filteredRooms = [Room]()
    let searchController = UISearchController(searchResultsController: nil)
    
    // View Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Search Controller
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        
        // Scope Bar
        searchController.searchBar.scopeButtonTitles = ["All", "Classroom", "Conference", "Theater"]
        tableView.tableHeaderView = searchController.searchBar
        
        rooms = [
            Room(category:"Classroom", name:"101"),
            Room(category:"Classroom", name:"102"),
            Room(category:"Classroom", name:"103"),
            Room(category:"Classroom", name:"107"),
            Room(category:"Classroom", name:"108"),
            Room(category:"Classroom", name:"201"),
            Room(category:"Classroom", name:"202"),
            Room(category:"Classroom", name:"203"),
            Room(category:"Classroom", name:"207"),
            Room(category:"Classroom", name:"208"),
            Room(category:"Classroom", name:"209A"),
            Room(category:"Classroom", name:"212A"),
            Room(category:"Conference", name:"110G"),
            Room(category:"Conference", name:"111"),
            Room(category:"Conference", name:"113"),
            Room(category:"Conference", name:"114"),
            Room(category:"Food", name:"120"),
            Room(category:"Department", name:"Dean's office"),
            Room(category:"Theater", name:"124"),
            Room(category:"All", name:"Second floor"),]
        
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
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
        if searchController.active && searchController.searchBar.text != "" {
            return filteredRooms.count
        }
        return rooms.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let room: Room
        if searchController.active && searchController.searchBar.text != "" {
            room = filteredRooms[indexPath.row]
        } else {
            room = rooms[indexPath.row]
        }
        cell.textLabel!.text = room.name
        cell.detailTextLabel!.text = room.category
        return cell
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredRooms = rooms.filter({( room : Room) -> Bool in
            let categoryMatch = (scope == "All") || (room.category == scope)
            return categoryMatch && room.name.lowercaseString.containsString(searchText.lowercaseString)
        })
        tableView.reloadData()
    }
    
    // Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let room: Room
                if searchController.active && searchController.searchBar.text != "" {
                    room = filteredRooms[indexPath.row]
                } else {
                    room = rooms[indexPath.row]
                }
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
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