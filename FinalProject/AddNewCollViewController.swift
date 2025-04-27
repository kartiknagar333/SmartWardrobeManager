//
//  AddNewCollViewController.swift
//  FinalProject
//
//  Created by CDMStudent on 3/17/25.
//

import UIKit

class AddNewCollViewController: UIViewController {

    
    @IBOutlet weak var colnameTF: UITextField!
    var collectionToEdit: Collection?
    
    
    @IBOutlet weak var subcateTF: UITextField!
    
    var str = "add"
    
    @IBOutlet weak var addbtn: UIButton!
    
    @IBOutlet weak var toplabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let coll = collectionToEdit {
            str = "edit"
            colnameTF.text = coll.collectionName
            subcateTF.text = coll.collectionCategory
            addbtn.setTitle("Save", for: .normal)
            toplabel.text = "Edit Collection"
        }
    
    }
    

    @IBAction func TapAddbtn(_ sender: Any) {
        
        if let text = colnameTF.text, !text.trimmingCharacters(in: .whitespaces).isEmpty {
            let alertController = UIAlertController(
                title: "Collection Alert",
                message: "Do want to \(str) \(text) Collection?",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default){ _ in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(okAction)
            
            let cancelAction = UIAlertAction(title: "NO", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)

            
        } else {
            let alertController = UIAlertController(
                title: "Collection Alert",
                message: "Please type collection name",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .cancel,handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)

        }

    }
    

}
