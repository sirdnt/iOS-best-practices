//
//  CSVViewController.swift
//  iOS-best-practices
//
//  Created by Sir.DNT on 4/8/19.
//  Copyright © 2019 Sir.DNT. All rights reserved.
//

import UIKit

class CSVViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSaveTouch(_ sender: Any) {
        
        var csvText = "Name,Age,Email\n"
        let newLine = "Nguyen Van C, 30, anv1990@gmail.com\n"
        
        let fileName = "Employees.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        if FileManager.default.fileExists(atPath: (path?.path)!) {
            do {
                csvText = try String.init(contentsOf: path!)
                if !csvText.hasSuffix("\n") {
                    csvText.append("\n")
                }
            } catch {
                NSLog("error read text")
            }
        }
        csvText.append(contentsOf: newLine)
        NSLog("save to path : %@", path?.absoluteString ?? "nil")
        do {
            try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Failed to create file")
            print("\(error)")
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
