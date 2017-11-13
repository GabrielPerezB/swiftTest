//
//  PhotosTableViewController.swift
//  AlbumWS
//
//  Created by Estudiante on 7/9/16.
//  Copyright © 2016 Tecnologico de Costa Rica. All rights reserved.
//

import UIKit

class PhotosTableViewController: UITableViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var albumID : Int!
    
    var tableViewPhotosData = [Photo]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = Constants.PHOTOS_TITLE
        connect()
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
        return self.tableViewPhotosData.count
        
    }
    
    // MARK: - UI Methods
    func setTableView(_ photoData: [Photo]){
        tableViewPhotosData = photoData
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.tableView.reloadData()
    }
    
    
    // MARK: - WebService connection
    func connect(){
        self.activityIndicator.startAnimating()
        
        let urlPath : String = Constants.BASE_URL + Constants.PHOTOS_URL
        let url = URL(string: urlPath)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url, completionHandler: {ourData, response, error -> Void in
            
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            /*
            let convergedString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(convergedString)
            */
            
            // print(statusCode)
            
            if statusCode == Constants.STATUS_OK {
                
                DispatchQueue.main.async{
                    
                    
                    self.setTableView(JSONParser.parsePhotos(data: ourData!, albumID: self.albumID))
                }
                
            }
            
        })
        
        task.resume()
    }

    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photosCell", for: indexPath)

        let photo = self.tableViewPhotosData[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = photo.title

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPhotoSegue"{
        
            let dvc = segue.destination as! PhotoViewController
            let indexPath = self.tableView.indexPathForSelectedRow! as IndexPath
            dvc.currentPhoto = self.tableViewPhotosData[(indexPath as NSIndexPath).row]

        }
    }


}
