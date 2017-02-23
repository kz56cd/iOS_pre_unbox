//
//  User.swift
//  preUnbox
//
//  Created by msano on 2017/02/23.
//  Copyright © 2017年 msano. All rights reserved.
//

import Unbox

struct User {
    let name: String
//    let age: Int
//    let runningDistance: Int
//    let primaryDeviceName: String
}

extension User: Unboxable {
    init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
    }
}
