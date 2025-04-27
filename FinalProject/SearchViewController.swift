//
//  HomeViewController.swift
//  FinalProject
//
//  Created by CDMStudent on 3/13/25.
//

import UIKit

class SearchViewController: UIViewController {
    let outfits = mainOutfits
    
    @IBOutlet weak var filterview: UIView!
    @IBOutlet weak var applybtn: UIButton!
    @IBOutlet weak var searchcollectionview: UICollectionView!
    var filteredOutfits: [Outfit] = []
    @IBOutlet weak var searchbaroutfit: UISearchBar!
    
    @IBOutlet weak var filterbtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchcollectionview.delegate = self
        searchcollectionview.dataSource = self
    }
   
    @IBAction func Tapfilterbtn(_ sender: Any) {
        if filterview.isHidden {
            filterview.isHidden = false
            searchcollectionview.isHidden = true
            if let icon = UIImage(systemName: "xmark.circle") {
                filterbtn.image = icon
            }
        }else{
            filterview.isHidden = true
            searchcollectionview.isHidden = false
            if let icon = UIImage(systemName: "line.3.horizontal.decrease.circle.fill") {
                filterbtn.image = icon
            }
        }
    }

    @IBAction func Tapapplybtn(_ sender: Any) {
        filterview.isHidden = true
        searchcollectionview.isHidden = false
        if let icon = UIImage(systemName: "line.3.horizontal.decrease.circle.fill") {
            filterbtn.image = icon
        }
    }
    
}

extension SearchViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredOutfits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchitemcell", for: indexPath) as!
        SearchCollectionViewCell
        
        let outfit = filteredOutfits[indexPath.row]
        
        cell.centerImg.image = UIImage(named:outfit.imagePath)
        cell.toplabel.text = outfit.outfitName
        
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 0.2
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
        let totalSpacing = spacing * 3
        let width = (collectionView.frame.width - totalSpacing) / 2
        return CGSize(width: width, height: width * 1.5)
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
        
        vc.imgpath = UIImage(named: filteredOutfits[indexPath.row].imagePath)
        vc.name =  filteredOutfits[indexPath.row].scheduleDate
        vc.colname = filteredOutfits[indexPath.row].collectionName
        vc.colcate = filteredOutfits[indexPath.row].collectionCategory
        vc.isLaundry = filteredOutfits[indexPath.row].needLaundry
        vc.isironing = filteredOutfits[indexPath.row].needIroning
        vc.scheduletime = filteredOutfits[indexPath.row].scheduleDate
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            filteredOutfits = []
            searchcollectionview.reloadData()
            return
        }
        
        let lowercasedSearchText = searchText.lowercased()
              filteredOutfits = outfits.filter { outfit in
                  return outfit.outfitName.lowercased().contains(lowercasedSearchText) ||
                  outfit.collectionName.lowercased().contains(lowercasedSearchText) ||
                  outfit.collectionCategory.lowercased().contains(lowercasedSearchText) ||
                  outfit.scheduleNote.lowercased().contains(lowercasedSearchText)
              }
        
        searchcollectionview.reloadData()
    }
}
