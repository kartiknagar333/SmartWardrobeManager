//
//  laundryViewController.swift
//  FinalProject
//
//  Created by CDMStudent on 3/16/25.
//

import UIKit

class laundryViewController: UIViewController {

    @IBOutlet weak var confirmbtn: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var labeldisplay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    
    @IBAction func TapStepper(_ sender: UIStepper) {
        labeldisplay.text = "\(Int(sender.value))"
    }
    
    @IBAction func Tapcconfirmbtn(_ sender: Any) {
        let itemCount = Int(labeldisplay.text ?? "0") ?? 0
          
          let alertMessage: String
          if itemCount == 0 {
              alertMessage = "You haven't selected any items."
          } else {
              alertMessage = "Notify when you reach \(itemCount) items?"
          }
          
          let alertController = UIAlertController(
              title: "Laundry Alert",
              message: alertMessage,
              preferredStyle: .alert
          )
          
        let okAction = UIAlertAction(title: itemCount != 0 ? "YES" : "OK", style: .default) { _ in
              print("User confirmed the alert.")
              if itemCount != 0 {
                       self.dismiss(animated: true, completion: nil)
                   }
          }
          alertController.addAction(okAction)
          
          if itemCount != 0 {
              let cancelAction = UIAlertAction(title: "NO", style: .cancel, handler: nil)
              alertController.addAction(cancelAction)
          }
          
          present(alertController, animated: true, completion: nil)
    }
}
