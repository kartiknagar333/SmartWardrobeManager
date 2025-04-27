//
//  CollectionOutfitViewController.swift
//  FinalProject
//
//  Created by CDMStudent on 3/17/25.
//

import UIKit

class CollectionOutfitViewController: UIViewController {


    @IBOutlet weak var mycollectionview: UICollectionView!
    @IBOutlet weak var category: UILabel!
    
    var titlestr: String?
    var prompt: String?
    var mycollist: [Outfit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mycollectionview.delegate = self
        mycollectionview.dataSource = self
        self.navigationController?.title = titlestr
        self.navigationController?.navigationItem.prompt = prompt
        category.text = prompt
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressGesture.minimumPressDuration = 0.5 
        mycollectionview.addGestureRecognizer(longPressGesture)
   
    }
    
    @IBAction func Tapaddnewoutfit(_ sender: Any) {
    }
   
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state != .began {
            return
        }
        
        let point = gesture.location(in: mycollectionview)
        
        if let indexPath = mycollectionview.indexPathForItem(at: point) {
            let selectedOutfit = mycollist[indexPath.row]
            
            let actionSheet = UIAlertController(title: selectedOutfit.outfitName,
                                              message: "Choose an action",
                                         preferredStyle: .actionSheet)
            
            actionSheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { [weak self] _ in
                self?.editOutfit(at: indexPath)
            }))
            
            actionSheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
                self?.deleteOutfit(at: indexPath)
            }))
            
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            // Present the action sheet
            present(actionSheet, animated: true)
        }
    }
    func editOutfit(at indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNewOutfitViewController") as! AddNewOutfitViewController
       
        vc.isPhotoexisted = true
        let outfitToEdit = mycollist[indexPath.row]
        vc.outfitToEdit = outfitToEdit
        
        vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
    }

    func deleteOutfit(at indexPath: IndexPath) {
        let alert = UIAlertController(title: "Delete Outfit",
                                    message: "Are you sure you want to delete this outfit?",
                              preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
            guard let self = self else { return }
            self.mycollist.remove(at: indexPath.row)
            self.mycollectionview.deleteItems(at: [indexPath])

        }))
        
        present(alert, animated: true)
    }
}

extension CollectionOutfitViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mycollist.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myViewCell", for: indexPath) as! myViewCell
        cell.outfitname.text =  mycollist[indexPath.row].outfitName
        cell.outfitImg.image = UIImage(named: mycollist[indexPath.row].imagePath)
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 0.2
        
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
        let totalSpacing = spacing * 3
        let width = (collectionView.frame.width - totalSpacing) / 2
        return CGSize(width: width, height: width-20)
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
        
        vc.imgpath = UIImage(named: mycollist[indexPath.row].imagePath)
        vc.name =  mycollist[indexPath.row].outfitName
        vc.colname = mycollist[indexPath.row].collectionName
        vc.colcate = mycollist[indexPath.row].collectionCategory
        vc.isLaundry = mycollist[indexPath.row].needLaundry
        vc.isironing = mycollist[indexPath.row].needIroning
        vc.scheduletime = mycollist[indexPath.row].scheduleDate
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
