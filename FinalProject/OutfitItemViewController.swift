//
//  OutfitItemViewController.swift
//  FinalProject
//
//  Created by CDMStudent on 3/13/25.
//

import UIKit

class OutfitItemViewController: UIViewController {
    @IBOutlet weak var cancelbtn: UIButton!
    
    @IBOutlet weak var infoview: UIStackView!
    @IBOutlet weak var scheduleview: UIStackView!
    @IBOutlet weak var ColName: UILabel!

    @IBOutlet weak var datetime: UIDatePicker!
    @IBOutlet weak var mainimg: UIImageView!
    
    @IBOutlet weak var laundrySwitch: UISwitch!
    @IBOutlet weak var ColCateName: UILabel!
    
    @IBOutlet weak var ironingSwitvh: UISwitch!
    
    @IBOutlet weak var ScheduleTime: UILabel!
    
    @IBOutlet weak var schedulebtn: UIButton!
    
    
    
    
    
    var imgpath: UIImage?
    var name: String?
    var isLaundry : Bool?
    var isironing: Bool?
    var colname: String?
    var colcate: String?
    var scheduletime: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = name
        mainimg.image = imgpath
        ColName.text = colname
        ColCateName.text = colcate
        laundrySwitch.isOn = isLaundry ?? false
        ironingSwitvh.isOn = isironing ?? false
        ScheduleTime.text = scheduletime
    }

    @IBAction func TapSchedulebtn(_ sender: Any) {
        if infoview.isHidden {
            
            let selectedDate = datetime.date
              let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "E, d MMM h:mm a"
              let formattedDate = dateFormatter.string(from: selectedDate)
            
            let alertController = UIAlertController(
                title: "Schedule Alert",
                message: "Do you want to schedule this outfit at \(formattedDate)?",
                preferredStyle: .alert
            )
            
            let yesAction = UIAlertAction(title: "YES", style: .default) { _ in
                self.infoview.isHidden = false
                self.scheduleview.isHidden = true
                self.schedulebtn.setTitle("Schedule", for: .normal)
            }
            alertController.addAction(yesAction)
            
            let cancelAction = UIAlertAction(title: "NO", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
        } else {
            infoview.isHidden = true
            scheduleview.isHidden = false
            schedulebtn.setTitle("Confirm", for: .normal)
        }
    }
    
    @IBAction func Tapcancelbtn(_ sender: Any) {
        
        infoview.isHidden = false
        scheduleview.isHidden = true
        schedulebtn.setTitle("Schedule", for: .normal)
    }
    
}
