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
    let age: Int
    let profession: Profession
    let runningDistance: Int
    let primaryDeviceName: String
}

extension User: Unboxable {
    init(unboxer: Unboxer) throws {
        name = try unboxer.unbox(key: "name")
        age = try unboxer.unbox(key: "age")
        profession = try unboxer.unbox(key: "profession")                               // Built-in enum support
        runningDistance = try unboxer.unbox(keyPath: "activities.running.distance")     // Key path support
        primaryDeviceName = try unboxer.unbox(keyPath: "devices.0")                     // Key path support
    }
}

enum Profession: Int, UnboxableEnum {
    case developer
    case astronaut
}
