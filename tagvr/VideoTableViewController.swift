//
//  VideoTableViewController.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 19/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit
import AVFoundation

class VideoTableViewController: UITableViewController {
    
    var videos = [Video]()
    
    func loadSampleVideos() {
        
        let photo1 = UIImage(named: "image1")!
        let video1 = Video(photo: photo1, title: "Tag The Agency", duration: "0:24", video: "https://1819948887.rsc.cdn77.org/videos/TAG%20The%20Agency%20(1).mp4")!
        let video2 = Video(photo: photo1, title: "Tag The Agency Facebook Apps", duration: "0:24", video: "https://1819948887.rsc.cdn77.org/videos/TAG%20The%20Agency%20-%20Facebook%20Apps%20(1).mp4")!
        let video3 = Video(photo: photo1, title: "UX NZ 2015 - Your conference in a nutshell", duration: "0:24", video: "https://1819948887.rsc.cdn77.org/videos/UX%20New%20Zealand%202015%20-%20Your%20conference%20in%20a%20nutshell.mp4")!
        let video4 = Video(photo: photo1, title: "Tag The Agency Vr Carboard", duration: "0:24", video: "https://1819948887.rsc.cdn77.org/videos/TAG%20The%20Agency%20-%20VR%20Cardboard.mp4")!
        let video5 = Video(photo: photo1, title: "Tag The Agency 2016 Showreel", duration: "0:24", video: "https://1819948887.rsc.cdn77.org/videos/TAG%202016%20Showreel%20(2).mp4")!
        let video6 = Video(photo: photo1, title: "Holograms - dreams become reality", duration: "0:24", video: "https://1819948887.rsc.cdn77.org/videos/Holograms%20-%20dreams%20become%20reality.mp4")!
        let video7 = Video(photo: photo1, title: "Agile NZ Conference part 1", duration: "0:24", video: "https://1819948887.rsc.cdn77.org/videos/Agile%20NZ%20Conference%20Part%201.mp4")!
        let video8 = Video(photo: photo1, title: "Agile NZ 2015 Highlights", duration: "0:24", video: "https://1819948887.rsc.cdn77.org/videos/Agile%20NZ%202015%20Highlights.mp4")!
        videos += [video1, video2, video3, video4, video5, video6, video7, video8]
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImage(named: "space.jpg")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView


        loadSampleVideos()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func generateThumnail(url:URL) -> UIImage?
    {
        let asset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        imageGenerator.appliesPreferredTrackTransform = true
        
        var time = asset.duration
        //If possible - take not the first frame (it could be completely black or white on camara's videos)
        time.value = min(time.value, 2)
        
        do {
            let imageRef = try imageGenerator.copyCGImage(at: time, actualTime: nil)
            return UIImage(cgImage: imageRef)
        }
        catch let error as NSError
        {
            print("Image generation failed with error \(error)")
            return nil
        }
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
        
        let url = URL(string: video.video)
        cell.backgroundImage.image = generateThumnail(url: url!)
//        cell.backgroundImage.image = video.photo
        cell.title.text = video.title
        cell.backgroundColor = .clear
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
