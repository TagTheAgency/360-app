//
//  VideoTableViewController.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 19/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit

class VideoTableViewController: UITableViewController {
    
    var videos = [Video]()
    
    func loadSampleVideos() {
        
        let photo1 = UIImage(named: "image1")!
        let video1 = Video(photo: photo1, title: "Bunny Trailer", duration: "1:00", video: "http://www.tagtheagency.com/TAG%202016%20Showreel%20(1).mp4")!
        videos += []
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleVideos()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "VideoTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! VideoTableViewCell
        
        let video = videos[indexPath.row]
        
        cell.backgroundImage.image = video.photo
        cell.title.text = video.title
        
        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "ShowVideoDetail" {
             let VideoDetailViewController = segue.destination as! VideoViewController
             
             if let selectedVideoCell = sender as? VideoTableViewCell {
                 let indexPath = tableView.indexPath(for: selectedVideoCell)!
                 let selectedVideo = videos[indexPath.row]
                 VideoDetailViewController.video = selectedVideo
             }
         }
    }

}
