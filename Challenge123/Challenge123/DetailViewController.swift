//
//  DetailViewController.swift
//  Challenge123
//
//  Created by Jose Francisco Fornieles on 12/04/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Properties
    var nameFlag: String?
    var assetFlag: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let name = nameFlag, let asset = assetFlag {
            title = name
            imageView.layer.borderWidth = 1
            imageView.layer.borderColor = UIColor.lightGray.cgColor
            imageView.image = UIImage(named: asset)
        }
    }
    
}
