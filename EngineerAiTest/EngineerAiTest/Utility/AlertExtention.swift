//
//  AlertExtention.swift
//  EngineerAiTest
//
//  Created by Techment bhuvan on 09/12/19.
//  Copyright © 2019 Techment bhuvan. All rights reserved.
//

import UIKit

extension  UIViewController {

    func displayAlertView(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
