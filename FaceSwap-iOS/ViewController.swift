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
  
  @IBOutlet weak var imageShadowView: UIView!
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
    imageView.contentMode = UIViewContentMode.ScaleAspectFit
    
    // activate the faceswap module
    // faceSwap!.run(image)
    
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // initialize the new faceswap module
    faceSwap = FaceSwap()
    
    var cornerRadius = imageView.frame.size.width/2
    
    imageShadowView.layer.shadowOffset = CGSizeMake(0,0)
    imageShadowView.layer.shadowOpacity = 1
    imageShadowView.layer.shadowRadius = 5
    imageShadowView.layer.shadowColor = UIColor.grayColor().CGColor
    imageShadowView.layer.shadowPath = UIBezierPath(arcCenter: CGPoint(x: imageShadowView.frame.size.width/2, y: imageShadowView.frame.size.height/2), radius: cornerRadius, startAngle: 0, endAngle: 360, clockwise: true).CGPath
    imageShadowView.layer.cornerRadius = cornerRadius
    
    imageView.layer.cornerRadius = cornerRadius
    imageView.clipsToBounds = true
    imageShadowView.addSubview(imageView)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

