//
//  ViewController.swift
//  MutliThreading
//
//  Created by Palanichamy Padmanabhan on 22/11/18.
//  Copyright © 2018 Palanichamy Padmanabhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let urlString = "http://res.cloudinary.com/demo/image/upload/w_400/l_upload:multiple:folders:sample,w_200/brown_sheep.jpg"
    var url : NSURL!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        url = NSURL(string: urlString)
        activityIndicatorView.isHidden = true
    }

    @IBAction func btnDownloadClicked(_ sender: Any) {
//        let data = NSData(contentsOf: url as URL)
//        self.imgView.image = UIImage.init(data: (data as Data?)!)
        activityIndicatorView.isHidden = false
        URLSession.shared.dataTask(with: url as URL) { (data, resp, error) in
            if error == nil && data != nil {
//                DispatchQueue.main.async(execute: {
//                    self.imgView.image = UIImage.init(data: data!)
//                })
                
                OperationQueue.main.addOperation({
                    self.activityIndicatorView.isHidden = true
                    self.imgView.image = UIImage.init(data: data!)
                })
                
            }
        }.resume()
    }
    
}

