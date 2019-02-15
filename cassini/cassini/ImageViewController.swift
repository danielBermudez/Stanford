//
//  ImageViewController.swift
//  cassini
//
//  Created by Daniel Bermudez on 2/15/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    var imageURL : URL?{
        didSet{
            imageView.image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    

    @IBOutlet weak var imageView: UIImageView!
    private func fetchImage(){
        if let url = imageURL{
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents{
                imageView.image = UIImage(data:imageData) 
            }
        
        }}
    override func viewDidLoad() {
        super.viewDidLoad()
//        if (imageURL == nil ){
//            imageURL = demoURL.stanford
//        }
        
    }}



