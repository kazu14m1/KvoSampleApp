//
//  TestTabBarViewController.swift
//  SampleApp
//
//  Created by Kazuki MIHARA on 2017/06/29.
//  Copyright © 2017年 Kazuki MIHARA. All rights reserved.
//

import UIKit

class TestTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TestRepository.sharedInstance.setDelegate(self)
        TestRepository.sharedInstance.get("TabBar")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(self.selectedIndex)
        if self.selectedIndex == 1 {
            TestRepository.sharedInstance.get("didSelect")
        }
    }

}

extension TestTabBarViewController:TestDelegate {
    func didGet(_ str:String) {
        print("fugafuga \(str)")
    }
}
