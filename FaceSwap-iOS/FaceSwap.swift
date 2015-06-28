//
//  FaceSwap.swift
//  FaceSwap-iOS
//
//  Created by Vincent Zhao on 6/28/15.
//  Copyright (c) 2015 Vincent Zhao. All rights reserved.
//

import Foundation
import UIKit
import Starscream
import SwiftyJSON

class FaceSwap: WebSocketDelegate {
  var image: UIImage? // this will be nil at first
  
  func run(image: UIImage) {
    self.image = image // set the image to a new one
    // and then send this stuff to the server
    println(image.size)
    println("ready to send WebSocket")
    
    var socket = WebSocket(url: NSURL(scheme: "ws", host: "faceswap.herokuapp.com", path: "/ws")!)
    // then this FaceSwap module is a websocket delegate
    socket.delegate = self
    // this is a asynchronous function, so the run() function could immediately
    // return. When there's a need to send data, put it inside those delegate handlers
    socket.connect()
    // however if the server is invalid, what should we do?
  }
  func websocketDidConnect(socket: WebSocket) {
    println("websocket is connected")
    
    var imageData = UIImagePNGRepresentation(self.image!)
    var imageDataWithBase64Encoding = imageData.base64EncodedStringWithOptions(.allZeros)
    //println(imageDataWithBase64Encoding)
    let json = JSON(["action": "query", "content": imageDataWithBase64Encoding])
    if let data = json.rawData() {
      socket.writeData(data)
    }
  }
  func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
    println("websocket is disconnected: \(error?.localizedDescription)")
  }
  func websocketDidReceiveData(socket: WebSocket, data: NSData) {
    println("got some data: \(data.length)")
  }
  func websocketDidReceiveMessage(socket: WebSocket, text: String) {
    if let dataFromString = text.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
      let json = JSON(data: dataFromString)
      println(json["action"])
    }
  }
}