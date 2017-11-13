//
//  PhotoViewController.swift
//  AlbumWS
//
//  Created by Estudiante on 9/9/16.
//  Copyright © 2016 Tecnologico de Costa Rica. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
 
    var currentPhoto : Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = Constants.PHOTO_TITLE
        self.titleLabel.text = self.currentPhoto?.title
        
        let url = URL(string: self.currentPhoto!.url)
        let imageData = try? Data(contentsOf: url!)
        let image = UIImage(data: imageData!)
        self.imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
