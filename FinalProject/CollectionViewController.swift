//
//  HomeViewController.swift
//  FinalProject
//
//  Created by CDMStudent on 3/13/25.
//

import UIKit

class CollectionViewController: UIViewController {

    var collectionlist = collections
    var outfits = mainOutfits
    
    @IBOutlet weak var addcollectionbtn: UIBarButtonItem!
    @IBOutlet weak var outfitcollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        outfitcollectionview.delegate = self
        outfitcollectionview.dataSource = self
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressGesture.minimumPressDuration = 0.5
        outfitcollectionview.addGestureRecognizer(longPressGesture)
    }
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state != .began {
            return
        }
        
        let point = gesture.location(in: outfitcollectionview)
        
        if let indexPath = outfitcollectionview.indexPathForItem(at: point) {
            let selectedOutfit = collectionlist[indexPath.row]
            
            let actionSheet = UIAlertController(title: selectedOutfit.collectionName,
                                              message: "Choose an action",
                                         preferredStyle: .actionSheet)
            
            actionSheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { [weak self] _ in
                self?.editcollection(at: indexPath)
            }))
            
            actionSheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
                self?.deletecollection(at: indexPath)
            }))
            
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            // Present the action sheet
            present(actionSheet, animated: true)
        }
    }
    func editcollection(at indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNewCollViewController") as! AddNewCollViewController
       
        let coll = collectionlist[indexPath.row]
        vc.collectionToEdit = coll
        
        vc.modalPresentationStyle = .fullScreen 
            self.present(vc, animated: true, completion: nil)
    }

    func deletecollection(at indexPath: IndexPath) {
        let alert = UIAlertController(title: "Delete collection",
                                    message: "Are you sure you want to delete this collection?",
                              preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
            guard let self = self else { return }
            self.collectionlist.remove(at: indexPath.row)
            self.outfitcollectionview.deleteItems(at: [indexPath])

        }))
        
        present(alert, animated: true)
    }
    @IBAction func Tapaddcollectionbtn(_ sender: Any) {
        
    }
}

extension CollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return collectionlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "outfitcollItemcell", for: indexPath) as!
        OutfitColCollectionView
        
        let col = collectionlist[indexPath.row]
        
        cell.collectionname.text = col.collectionName
        cell.collectiontype.text = col.collectionCategory
        
        cell.firstimage.image = UIImage(named: col.img1)
        cell.secondimage.image = UIImage(named: col.img2)
        
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 0.2
        
        return cell
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
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CollectionOutfitViewController")
        as! CollectionOutfitViewController
        
        vc.title = collectionlist[indexPath.row].collectionName
        vc.prompt = collectionlist[indexPath.row].collectionCategory
        
        vc.mycollist = outfits.filter { outfit in
            return outfit.collectionName.contains(collectionlist[indexPath.row].collectionName)
       }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
