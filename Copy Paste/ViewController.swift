//
//  ViewController.swift
//  Copy Paste
//
//  Created by Rafael on 2019-12-15.
//  Copyright © 2019 Rafael Montenegro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let DATA_KEY = "DATA_KEY"
    
    @IBOutlet weak var textView: UITextView!
    
    var pastedStrings: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //If we can load a string from the local storage, then have it in the pastedStrings array.
        if let loadedStrings = UserDefaults.standard.stringArray(forKey: DATA_KEY){
            pastedStrings.append(contentsOf: loadedStrings)
        }
        
        showText()
        
    }
    
    func addText() {
        
        //Only proceed if there is something in the pasteboard, and if the pastedStrings dosen't containt the value in the pasteboard.
        guard let text = UIPasteboard.general.string, !pastedStrings.contains(text) else {
            return
        }
        
        //If all good, then add it to the end of the array:
        pastedStrings.append(text)
        UserDefaults.standard.set(pastedStrings, forKey: DATA_KEY)
        
        showText()
    }
    
    /**
     Displays text contained in the pastedStrings array.
     */
    func showText(){
        textView.text = ""
        
        for str in pastedStrings {
            textView.text.append("\(str)\n\n")
        }
    }

    @IBAction func trashPressed(_ sender:   Any) {
        
        pastedStrings.removeAll()
        textView.text = ""
        
        UserDefaults.standard.removeObject(forKey: DATA_KEY)
        
    }
    
}

