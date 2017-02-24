//
//  User.swift
//  preUnbox
//
//  Created by msano on 2017/02/23.
//  Copyright © 2017年 msano. All rights reserved.
//

import UIKit
import Unbox

struct User {
    let name: String
    let age: Int
    let firstURL: UniqueURL
    let profession: Profession
    let runningDistance: Int
    let primaryDeviceName: String
}

extension User: Unboxable {
    init(unboxer: Unboxer) throws {
        name = try unboxer.unbox(key: "name")
        age = try unboxer.unbox(key: "age")
        firstURL = try unboxer.unbox(key: "firstURL")                                   // Transformations
        profession = try unboxer.unbox(key: "profession")                               // Built-in enum support
        runningDistance = try unboxer.unbox(keyPath: "activities.running.distance")     // Key path support
        primaryDeviceName = try unboxer.unbox(keyPath: "devices.0")                     // Key path support
    }
}

enum Profession: Int, UnboxableEnum {
    case developer
    case astronaut
}

struct UniqueURL: UnboxableByTransform {
    typealias UnboxRawValue = String
    
    let url: URL
    
    init?(urlString: String) {
        guard let url: URL = URL(string: urlString) else {
            return nil
        }
        self.url = url
    }
    
    static func transform(unboxedValue: String) -> UniqueURL? {
        return UniqueURL(urlString: unboxedValue)
    }
}
