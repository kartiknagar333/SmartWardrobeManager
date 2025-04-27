//
//  HomeViewController.swift
//  FinalProject
//
//  Created by CDMStudent on 3/13/25.
//

import UIKit

class HistoryViewController: UIViewController {
    
    let historylist = HistoryOutfits

    @IBOutlet weak var historyiCollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        historyiCollectionview.delegate = self
        historyiCollectionview.dataSource = self
    }
    
}

extension HistoryViewController:
    UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return historylist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "historyitemcell", for: indexPath) as! HistoryCollectionViewCell
        cell.schedaledate.text =  historylist[indexPath.row].scheduleDate
        cell.outfitimage.image = UIImage(named: historylist[indexPath.row].imagePath)
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 0.2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
        let totalSpacing = spacing * 3
        let width = (collectionView.frame.width - totalSpacing) / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 15
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 10
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
       }
    
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath)  {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OutfitItemViewController")
        as! OutfitItemViewController
        
        vc.imgpath = UIImage(named: historylist[indexPath.row].imagePath)
        vc.name =  historylist[indexPath.row].scheduleDate
        vc.colname = historylist[indexPath.row].collectionName
        vc.colcate = historylist[indexPath.row].collectionCategory
        vc.isLaundry = historylist[indexPath.row].needLaundry
        vc.isironing = historylist[indexPath.row].needIroning
        vc.scheduletime = historylist[indexPath.row].scheduleDate
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
