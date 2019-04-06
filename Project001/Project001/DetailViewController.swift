//
//  DetailViewController.swift
//  Project001
//
//  Created by Jose Francisco Fornieles on 06/04/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var numberOfPicture: Int = 0
    var totalPictures: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        title = "Picture \(numberOfPicture) of \(totalPictures)"
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
