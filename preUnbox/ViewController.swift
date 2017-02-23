//
//  ViewController.swift
//  preUnbox
//
//  Created by msano on 2017/02/23.
//  Copyright © 2017年 msano. All rights reserved.
//

import UIKit
import Unbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        shouldGetData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // private
    
    private func shouldGetData() {
        guard let data = getData() else {
            return
        }
        do {
            let user:User = try unbox(data: data)
            print(user)
        } catch {
            print("some error: \(error)")
        }
    }
    
    private func getData() -> Data? {
        guard let path = Bundle.main.path(forResource: "UserInfo", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
                return nil
        }
        return data
    }

}

