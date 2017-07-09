//
//  TestRepository.swift
//  SampleApp
//
//  Created by Kazuki MIHARA on 2017/06/29.
//  Copyright © 2017年 Kazuki MIHARA. All rights reserved.
//

import Foundation

protocol TestDelegate {
    func didGet(_ str:String)
}

extension TestDelegate {
    func didGet(_ str:String) {}
}

class TestRepository {
    static let sharedInstance:TestRepository = TestRepository()
    private var delegates = [TestDelegate]()

    private init() {}

    func setDelegate(_ delegate:TestDelegate) {
        delegates.append(delegate)
    }

    func get(_ str:String) {
        self.delegates.forEach({ (delegate) in
            delegate.didGet(str)
        })
    }
}
