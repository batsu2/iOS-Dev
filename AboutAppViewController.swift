//
//  AboutAppViewController.swift
//  BBut_QPrez
//
//  Created by Bryan Butz on 10/19/18.
//  Copyright © 2018 Bryan Butz. All rights reserved.
//
//  This controls the processes of the "About App" view
//  of the BButs_QPrez app. Displays information about
//  the app, allows email feedback, and link to About Author
//  html page

import UIKit
import MessageUI


class AboutAppViewController: UIViewController,
    MFMailComposeViewControllerDelegate
{
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Outputs the title "About App" to the console
        navigationItem.title = "About App"
    }
    
    
    
    @IBAction func sendEmailButton(_ sender: Any)
    {
        //check if sending an email is possible. If not, send message to user
        if !MFMailComposeViewController.canSendMail()
        {
            showMailError()
            return
        }
        else
        {
            let mailComposeVC = MFMailComposeViewController()
            mailComposeVC.mailComposeDelegate = self
            let toRecipients = ["niucsci@gmail.com"]
            let emailTitle = "BButzTopTenSalem"
            let messageBody = "Bryan Butz   z1836033    Due: 10/15/18"
            mailComposeVC.setToRecipients(toRecipients)
            mailComposeVC.setSubject(emailTitle)
            mailComposeVC.setMessageBody(messageBody, isHTML: false)
            self.present(mailComposeVC, animated: true, completion: nil)
            
            //Hoping this will dismiss as intended, never recieved feedback
            //as to how to properly dismiss & I can't test for this so this
            //is the best I can do currently
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    //Dismisses email
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    //This funciton outputs a message to the user when trying to send an email but
    //the device is incapable of email functionality
    func showMailError()
    {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device can not send email", preferredStyle: .alert )
        let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
