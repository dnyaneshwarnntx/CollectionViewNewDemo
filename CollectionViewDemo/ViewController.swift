//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Dnyaneshwar on 10/07/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,CellDelegate{

    var direction: String?
    var indexPathRow: Int?
    var cellSize: CGSize?
    var indexArray = [Any]()
    @IBOutlet public weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "cell"
    
    var items = ["Label",
                 "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                 "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                 "Label",
                 "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                 "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                 "Label",
                 "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                 "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(cellSize != nil){
            if indexArray.contains(obj: indexPath.row){
                return cellSize!
            }else{
                let width = (collectionView.frame.width - cellSize!.width - 30.0)/2
                let height = (collectionView.frame.height-cellSize!.height - 30.0)/2

                return CGSize(width: width < 0 ? 10 : width , height: height < 0 ? 10 : height)
            }
        }
        return CGSize(width: (collectionView.frame.width-50)/3, height: (collectionView.frame.width-50)/3)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Int(1)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        cell.myLabel.text = self.items[indexPath.row]
        cell.backgroundColor = UIColor.cyan
        cell.delegate = self
        
        return cell
    }
    
    func pinchGestureCallBack(scale: Float, mode: String, cell: UICollectionViewCell) {
        let indexPath = collectionView.indexPath(for: cell)
        if(indexPathRow == nil){
            indexPathRow = indexPath?.row
        }
        direction = mode

        if(mode == "H"){
//            var row = indexPathRow
//            for index in 0...2 {
//                if(indexPathRow - 3 <= 0){
//                    indexArray.append(row)
//                    row = row+3
//                }else{
//                    indexArray.append(row)
//                    row = row + 3
//
//                }
//
//            }
            if(indexPathRow == 0 || indexPathRow == 3||indexPathRow == 6){
                indexArray = [0,3,6]
            }else if(indexPathRow == 1 || indexPathRow == 4||indexPathRow == 7){
                indexArray = [1,4,7]
            }else if(indexPathRow == 2 || indexPathRow == 5||indexPathRow == 8){
                indexArray = [2,5,8]
            }
            cellSize = CGSize(width:cell.frame.size.width * CGFloat(scale) , height:cell.frame.size.height )
        }else if(mode == "V"){
            if(indexPathRow == 0 || indexPathRow == 1||indexPathRow == 2){
                indexArray = [0,1,2]
            }else if(indexPathRow == 3 || indexPathRow == 4||indexPathRow == 5){
                indexArray = [3,4,5]
            }else if(indexPathRow == 6 || indexPathRow == 7||indexPathRow == 8){
                indexArray = [6,7,8]
            }
            cellSize = CGSize(width:cell.frame.size.width , height:cell.frame.size.height * CGFloat(scale))

        }

        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }

    }
    func gestureCallBack(isEnded: Bool) {
        if(isEnded){
            indexPathRow = nil
        }
    }
}
extension Array {
     func contains<T>(obj: T) -> Bool where T: Equatable {
         return !self.filter({$0 as? T == obj}).isEmpty
     }
 }
