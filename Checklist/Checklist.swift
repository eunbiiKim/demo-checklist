//
//  Checklist.swift
//  Checklist
//
//  Created by 김은비 on 20/11/2019.
//  Copyright © 2019 eunbiiKim. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem]()
    init(name: String) {
        self.name = name
        super.init()
    }
    
//    func countUncheckedItems() -> Int {
//        var count = 0
//        for item in items where !item.checked {
//        count += 1
//        }
//    return count
//    }
    
    func countUncheckedItems() -> Int {
        return items.reduce(0) { cnt, item in cnt + (item.checked ? 0 : 1) }
    }
}
