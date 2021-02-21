//
//  AboutAuthorViewController.swift
//  BButz_QPrez
//
//  Created by Bryan Butz on 10/19/18.
//  Copyright © 2018 Bryan Butz. All rights reserved.
//
//  This controls the output of webview information by reading
//  from an html file and printing the information along with
//  an image.

import UIKit
import WebKit

class AboutAuthorViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Outputs the title "About Author" to the console
        navigationItem.title = "About Author"

        // Loads the html data into the variable "html"
        let path = Bundle.main.path(forResource: "index", ofType: "html")!
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let html = NSString(data: data,encoding:String.Encoding.utf8.rawValue)
        
        // Loads into the IBOutlet
        myWebView.loadHTMLString(html! as String, baseURL: Bundle.main.bundleURL)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myWebView: WKWebView!
    
}



/*
 guard let api_url = URL(string:"http://faculty.cs.niu.edu/~krush/f18/niucampus-json") else {return}
 
 // Create a URL request with the API address
 let urlRequest = URLRequest(url: api_url)
 
 // Submit a request to get the JSON data
 let task = URLSession.shared.dataTask(with: urlRequest)
 { (data,response,error) in
 
 // If there is an error, print the error and do not continue
 if error != nil
 {
 print(error!)
 return
 }
 
 // If there is no error, fetch the json formatted data
 if let content = data
 {
 do {
 let jsonObject = try JSONSerialization.jsonObject(with: content, options:
 JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
 
 // Fetch only the NIU Partial Campus buildings
 if let articlesJson = jsonObject["NIU Partial Campus"]
 as? [[String:AnyObject]]
 {
 for eachArticle in articlesJson
 {
 
 
 if let number = eachArticle["Number"] as? String,
 let name = eachArticle["BuildingName"] as? String,
 let code = eachArticle["BuildingCode"] as? String,
 let city = eachArticle["City"] as? String,
 let state = eachArticle["State"] as? String,
 let lat = eachArticle["Latitude"] as? String,
 let long = eachArticle["Longitude"] as? String,
 let urlToImage = eachArticle["BuildingImage"] as? String,
 let facts = eachArticle["Facts"] as? String
 {
 print("*****MARK: BEGIN*****")
 print("NUMBER:", number, "\n",
 "NAME:", name, "\n",
 "CODE:", code, "\n",
 "CITY:", city, "\n",
 "STATE:", state, "\n",
 "LATITUDE:", lat, "\n",
 "LONGITUDE:", long, "\n",
 "FACTS:", facts, "\n",
 "URL TO IMAGE:", urlToImage, "\n")
 print("*****MARK: END*****")
 } // end the inner "if" statement
 } //end the for loop
 } //end the outer "if" statement
 } // end the "do" loop
 catch { print(error) }
 } // end if
 } // end getDataSession
 task.resume()*/


