//
//  ViewController.swift
//  FaceSwap-iOS
//
//  Created by Vincent Zhao on 6/23/15.
//  Copyright (c) 2015 Vincent Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

  var faceSwap: FaceSwap?
  
  @IBOutlet weak var imageView: UIImageView!
  @IBAction func selectImageFromAlbum(sender: AnyObject) {
    var imagePickerController = UIImagePickerController()
    imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    imagePickerController.delegate = self
    self.presentViewController(imagePickerController, animated: false, completion: nil)
  }
  
  // This is a callback funtion, will activate the faceswap class from here
  func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
    imageView.image = image
    imageView.layer.cornerRadius = imageView.frame.size.width/2
    imageView.clipsToBounds = true
    
    // activate the faceswap module
    faceSwap!.run(image)
    
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // initialize the new faceswap module
    faceSwap = FaceSwap()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

