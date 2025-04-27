//
//  HomeViewController.swift
//  FinalProject
//
//  Created by CDMStudent on 3/13/25.
//

import UIKit


class HomeViewController: UIViewController {
    
    let outfits = ScheduleOutfits

    @IBOutlet weak var laundrybtn: UIBarButtonItem!
    @IBOutlet weak var homecollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        homecollectionview.delegate = self
            homecollectionview.dataSource = self
}
    
    @IBAction func taplaundrybtn(_ sender: Any) {
        
    }
    
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return outfits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homecell", for: indexPath) as! HomeCollectionViewCell
        cell.toplabel.text =  outfits[indexPath.row].scheduleDate
        cell.centerImg.image = UIImage(named: outfits[indexPath.row].imagePath)
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 0.2
        
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
        let totalSpacing = spacing * 3
        let width = (collectionView.frame.width - totalSpacing) / 2
        return CGSize(width: width, height: width * 2)
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
        
        vc.imgpath = UIImage(named: outfits[indexPath.row].imagePath)
        vc.name =  outfits[indexPath.row].outfitName
        
        vc.colname = outfits[indexPath.row].collectionName
        vc.colcate = outfits[indexPath.row].collectionCategory
        vc.isLaundry = outfits[indexPath.row].needLaundry
        vc.isironing = outfits[indexPath.row].needIroning
        vc.scheduletime = outfits[indexPath.row].scheduleDate
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
