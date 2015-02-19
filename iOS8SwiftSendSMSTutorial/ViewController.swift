//
//  ViewController.swift
//  iOS8SwiftSendSMSTutorial
//
//  Created by Kenneth Wilcox on 2/18/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func sendMessage(sender: UIButton) {
    var messageVC = MFMessageComposeViewController()
    messageVC.body = "For a good time call!"
    messageVC.recipients = ["4088675309", "6698675309"]
    messageVC.messageComposeDelegate = self
    
    self.presentViewController(messageVC, animated: true, completion: nil)
  }
  
}

extension ViewController: MFMessageComposeViewControllerDelegate {
  func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
    switch (result.value) {
    case MessageComposeResultCancelled.value:
      println("Message was cancelled")
      self.dismissViewControllerAnimated(true, completion: nil)
    case MessageComposeResultFailed.value:
      println("Message failed")
      self.dismissViewControllerAnimated(true, completion: nil)
    case MessageComposeResultSent.value:
      println("Message was sent")
      self.dismissViewControllerAnimated(true, completion: nil)
    default:
      break;
    }
  }
}