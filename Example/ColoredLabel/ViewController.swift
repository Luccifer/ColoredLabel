//
//  ViewController.swift
//  ColoredLabel
//
//  Created by Luccifer on 04/16/2019.
//  Copyright (c) 2019 Luccifer. All rights reserved.
//

import UIKit
import ColoredLabel

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var coloredLabel: UILabel!
    
    var isForest: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func startTimer() {
        if #available(iOS 10.0, *) {
            _ = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] (timer) in
                self?.imageView.image = (self?.isForest)! ? UIImage(named: "mountains") : UIImage(named: "forest")
                self?.isForest = !(self?.isForest)!
                self?.coloredLabel.colorLabelIfNeededWith(image: (self?.imageView.image)!, colorIfImageIsLight: .black, colorIfImageIsDark: .yellow, lightThreshhold: 0.5)
            }
        } else {
            // Fallback on earlier versions
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

