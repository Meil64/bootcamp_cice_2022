//
//  ViewController.swift
//  ObfuscatorTools
//
//  Created by Carlos Carrera on 4/4/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Obfuscator().bytesByObfuscatingString(string: "6faab7324cc86f2bc28ad99e5ea0e148"))
    }


}

