//
//  ContactPageController.swift
//  tagvr
//
//  Created by Tag User #1 on 11/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit
import MessageUI

class ContactPageController: UIViewController, MFMailComposeViewControllerDelegate {

    
    @IBOutlet weak var contactName: UITextField!
    @IBOutlet weak var contactEmail: UITextField!
    @IBOutlet weak var contactMessage: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMessage(_ sender: AnyObject) {
        
        let toRecipients = ["abc@tagtheangecy.com"]
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setToRecipients(toRecipients)
        mc.setSubject(contactName.text!)
        mc.setMessageBody("Name: \(contactName.text!) \n\nEmail: \(contactEmail) \n\nMessage: \(contactMessage)", isHTML: false)
        self.present(mc, animated: true, completion: nil)
    }
    
//    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
//        
//        switch result.rawValue {
//        case MFMailComposeResultCancelled.rawValue:
//            print()
//        case MFMailComposeResultFailed.rawValue:
//            print()
//        case MFMailComposeResultSaved.rawValue:
//            print()
//        case MFMailComposeResultSent.rawValue:
//            print()
//        default:
//            break
//        }
//        
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
    
    
    
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        self.resignFirstResponder()
    }
}
