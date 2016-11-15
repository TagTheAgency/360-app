//
//  VRPhotoTableViewController.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 14/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit

class VRPhotoTableViewController: UITableViewController {
    
    var vrPhotos = [VRPhoto]()

    
    func loadSamplePhotos() {
        let photo1 = VRPhoto(photo: UIImage(named: "beach-360")!, title: "Beach")!
        
        let photo2 = VRPhoto(photo: UIImage(named: "park-360")!, title: "Park")!
        
        let photo3 = VRPhoto(photo: UIImage(named: "cave-360")!, title: "Cave")!
        
        let photo4 = VRPhoto(photo: UIImage(named: "oriental_parade-360")!, title: "Oriental Parade")!
        
        let photo5 = VRPhoto(photo: UIImage(named: "pier-360")!, title: "Pier")!
        
        let photo6 = VRPhoto(photo: UIImage(named: "cafe-360")!, title: "Cafe")!
        
        let photo7 = VRPhoto(photo: UIImage(named: "winter-road-360")!, title: "Winter Road")!
        
        let photo8 = VRPhoto(photo: UIImage(named: "winter-forest-360")!, title: "Winter Forest")!
        
        let photo9 = VRPhoto(photo: UIImage(named: "cave-waterfall-360")!, title: "Cave Waterfall")!
        
        let photo10 = VRPhoto(photo: UIImage(named: "night-forest-360")!, title: "Night Forest")!
        
        let photo11 = VRPhoto(photo: UIImage(named: "moon-360")!, title: "Moon")!
        
        let photo12 = VRPhoto(photo: UIImage(named: "castle-360")!, title: "Castle")!
        
        let photo13 = VRPhoto(photo: UIImage(named: "watchtower-360")!, title: "Watchtower")!
        
        let photo14 = VRPhoto(photo: UIImage(named: "ocean-360")!, title: "Ocean View")!
        
        let photo15 = VRPhoto(photo: UIImage(named: "church-360")!, title: "Church")!
        
        let photo16 = VRPhoto(photo: UIImage(named: "on-the-river-360")!, title: "On the River")!
        
        let photo17 = VRPhoto(photo: UIImage(named: "winter-city-360")!, title: "City in Winter")!


        vrPhotos += [photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9, photo10, photo11, photo12, photo13, photo14, photo15, photo16, photo17]
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        loadSamplePhotos()
        
        let backgroundImage = UIImage(named: "space.jpg")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView

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
        return vrPhotos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "VRPhotoTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! VRPhotoTableViewCell

        let vrPhoto = vrPhotos[indexPath.row]
        
        cell.photoView.image = vrPhoto.photo
        cell.title.text = vrPhoto.title
        cell.backgroundColor = .clear
        
        
        return cell
    }

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
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhotoDetail" {
            let VRPhotoDetailViewController = segue.destination as! PanoramaViewController
            
            if let selectedVRPhotoCell = sender as? VRPhotoTableViewCell {
                let indexPath = tableView.indexPath(for: selectedVRPhotoCell)!
                let selectedVRPhoto = vrPhotos[indexPath.row]
                VRPhotoDetailViewController.vrPhoto = selectedVRPhoto
            }
        }
    }
}
