//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Yannis on 19/04/2017.
//  Copyright © 2017 hAppy. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet var user: UITextField!
    
    @IBOutlet var pswd: UITextField!

    @IBOutlet var answer: UILabel!
    
    @IBAction func auth(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String, let password = result.value(forKey: "password") as? String{
                        
                        print(username)
                        print(password)
                        
                        if user.text == username , pswd.text == password {
                            
                            answer.text = "Bravo!!"
                            
                        }
                        
                    }
                
                }
                
            }
            
        } catch {
            
            print("There was an error fetching")
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        /*let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("Cati", forKey: "username")
        newUser.setValue("Pass28", forKey: "password")
        newUser.setValue(19, forKey: "age")
        
        do {
            
            try context.save()
            print("Save successful")
            
        } catch {
            
            print("There was an error saving")
            
        }*/
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

