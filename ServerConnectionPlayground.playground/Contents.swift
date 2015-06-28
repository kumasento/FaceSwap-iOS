//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
XCPSetExecutionShouldContinueIndefinitely()

// there should be a ! and I don't know why.
// will NSURL fail?
let session: NSURLSession = NSURLSession.sharedSession()
let url:NSURL = NSURL(string: "https://faceswap.herokuapp.com/echo")!
let task = session.dataTaskWithURL(url, completionHandler: {
    (data, response, error) -> Void in
    println(response)
    let str: NSString = NSString(data: data, encoding: NSUTF8StringEncoding)!
    println(str)
})
task.resume()