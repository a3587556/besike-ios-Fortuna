//
//  ViewController.swift
//  Fortuna
//
//  Created by darkgod on 14/10/17.
//  Copyright (c) 2014年 darkgod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var delegate: AppDelegate!
    @IBOutlet weak var quotationTextView: UITextView!

    @IBAction func rootViewTapped(sender: UITapGestureRecognizer) {
        displayRandomQuote()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Hacking in Swift, since iOS8")
        println("controller: \(self)")
        println("view: \(self.view)")
        println("view's frame: \(self.view.frame)")
        
                // Do any additional setup after loading the view, typically from a nib.
        println("viewDidLoad quotationTextView: \(quotationTextView)")
        
        quotationTextView.editable = false
        quotationTextView.selectable = false
        
        delegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        displayRandomQuote()
    }
    
    
    
    func displayRandomQuote() {
        let usePositive = arc4random_uniform(2) == 0
        if usePositive {
            displayRandomQuoteFrom(delegate.positiveQuotes)
        }
        else {
            displayRandomQuoteFrom(delegate.negativeQuotes)
        }

    }
    
    func displayRandomQuoteFrom(quotes: [String]) {
        let i = Int(arc4random_uniform(UInt32(quotes.count)))
        let quote = quotes[i]
        quotationTextView.text = quote
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

