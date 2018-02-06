//
//  ViewController.swift
//  iphoneReg
//
//  Created by 陳函彤 on 2018/2/7.
//  Copyright © 2018年 陳函彤. All rights reserved.
//

//
//  ViewController.swift
//  iphonelog
//
//  Created by 陳函彤 on 2018/2/7.
//  Copyright © 2018年 陳函彤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let URL_SAVE_TEAM = "http://localhost/MyWebService1/api/createteam.php"
    
    
    @IBOutlet weak var uid: UITextField!
    @IBOutlet weak var pwd: UITextField!
    
    
    @IBAction func Register(_ sender: UIButton) {
        
    let requestURL = NSURL(string: URL_SAVE_TEAM)
        
        
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        
        request.httpMethod = "POST"
        
        
        let userid = uid.text
        let password = pwd.text
        
        
        let postParameters = "uid="+userid!+"&pwd="+password!;
        
        
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                print("error is \(String(describing: error))")
                return;
            }
            
            
            do {
                
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                
                if let parseJSON = myJSON {
                    var msg : String!
                    msg = parseJSON["message"] as! String?
                    print(msg)
                }
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
        uid.text=""
        pwd.text=""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}





