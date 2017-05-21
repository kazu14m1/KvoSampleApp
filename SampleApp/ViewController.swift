//
//  ViewController.swift
//  SampleApp
//
//  Created by Kazuki MIHARA on 2017/05/21.
//  Copyright © 2017年 Kazuki MIHARA. All rights reserved.
//

import UIKit

class Test: NSObject {
    var str = "test"
    
}

class KvoModel: NSObject {
    static let sharedInstance = KvoModel()
    
    private override init() {}
    
    dynamic var myDate = Date()
    dynamic var hoge = Test()
    
    func updateDate() {
        self.myDate = Date()
    }
    
    func updateHoge() {
        let a = Test()
        a.str = "hogehoge"
        self.hoge = a
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var sampleLabel: UILabel!
    @IBOutlet weak var hogeLabel: UILabel!
    @IBAction func button(_ sender: Any) {
        KvoModel.sharedInstance.updateDate()
    }
    @IBAction func hogeButton(_ sender: Any) {
        print("hogehoge")
        KvoModel.sharedInstance.updateHoge()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sampleLabel.text = KvoModel.sharedInstance.myDate.description
        hogeLabel.text = KvoModel.sharedInstance.hoge.str
        KvoModel.sharedInstance.addObserver(self, forKeyPath: "myDate", options: .new, context: nil)
        KvoModel.sharedInstance.addObserver(self, forKeyPath: "hoge", options: .new, context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidDisappear(_ animated: Bool) {
        KvoModel.sharedInstance.removeObserver(self, forKeyPath: "myDate")
        KvoModel.sharedInstance.removeObserver(self, forKeyPath: "hoge")
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "myDate") {
            self.sampleLabel.text = KvoModel.sharedInstance.myDate.description
            return
        }
        if (keyPath == "hoge") {
            print("hoge observe")
            self.hogeLabel.text = KvoModel.sharedInstance.hoge.str
        }
    }
}

