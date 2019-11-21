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
}
