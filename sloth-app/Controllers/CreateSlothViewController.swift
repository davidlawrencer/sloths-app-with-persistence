//
//  CreateSlothViewController.swift
//  sloth-app
//
//  Created by David Rifkin on 9/30/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class CreateSlothViewController: UIViewController {
    
    @IBOutlet weak var speedStepper: UIStepper!
    @IBOutlet weak var appendagesStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createSlothButton(_ sender: UIButton) {
        let newSloth = Sloth(appendages: Int(appendagesStepper.value), speed: Int(appendagesStepper.value))
            DispatchQueue.global(qos: .utility).async {
              try? SlothPersistenceHelper.manager.save(newSloth: newSloth)
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            }
    }
}

extension CreateSlothViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
