//
//  ViewController.swift
//  cryptoTracker
//
//  Created by Kewal Patel on 11/17/21.
//

import UIKit

class ViewController: UIViewController {

    

    @IBOutlet weak var OutputLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonPressed(_ sender: Any) {
    
    
       if let symbol = textField.text{
           
           getData(symbol : symbol)
           
            
            
        }
        
    
    
    
    }
    
    

    var url = "https://min-api.cryptocompare.com/data/price?tsyms=USD"
    
    
    
    func getData(symbol : String) {
    
        url = "\(url)&fsym=\(symbol)"
        
        
        
    //1. Initialize the URL
    
        guard let url = URL(string: url) else {return}
    
    //2. Initialize task and URL Session
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            
            // Check Optional
            
            guard let  data = data, error == nil else {return}
            
            print("Data Received")
            
            
            
            do {
            
            let Result = try JSONDecoder().decode(APIResponse.self, from: data)
            
            print(Result.USD)
                
                // String Interpolation
                
                
//                |HOV (Grand Central Dispatch)|1|2|3|4|5|
//
//                sync | async | concurrency | sequential
//
//                seq : A -> B -> C
//                conc :
//                A ------end time
//                B --------
//                C ---------

                DispatchQueue.main.async {
                    self.OutputLabel.text = "\(Result.USD)"
                }
                
                
            }
            catch {
                print(error.localizedDescription)
            
            }
            
        }
        
        
        //Resume task
        task.resume()
        
        
        
        //CLOSURE - create a function with function within function
        
        
        
}
    
    //5. Create a structure and mention  what the parameters are
    
    struct APIResponse : Codable {
        
        let USD : Float
        
        
        
    }
    
    
    

    //JASON OBJECT -> SWIFT FOUNDATION OBJECT
    
            //1. Initialize URL
           
            //2. Initialize Task and URL Session
           
            //3 Check Optionals
           
            //4. Resume Task
           
            //5. Define Response Parameters in a Structure
    
    
    
}
