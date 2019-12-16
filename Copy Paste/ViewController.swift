//
//  ViewController.swift
//  Copy Paste
//
//  Created by Rafael on 2019-12-15.
//  Copyright © 2019 Rafael Montenegro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = "Hello!!!"
        
    }

    @IBAction func trashPressed(_ sender:   Any) {
        
        textView.text = "Button Pressed!"
    }
    
}

