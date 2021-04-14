//
//  ViewController.swift
//  SegmentedPaging
//
//  Created by Paula Vasconcelos Gueiros on 14/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewColors = [UIColor.gray,UIColor.green,UIColor.red,UIColor.yellow,UIColor.blue,UIColor.brown]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Function to calculate cell index on scroll end
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>){
        let pagingIndex = targetContentOffset.pointee.x/self.view.frame.width
        // Set segmented controll current index
        segmentedControl.selectedSegmentIndex = Int(pagingIndex)
    }
    
    @IBAction func tappedSegmentedControl(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
    }
}

// CollectionView Methods

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewColors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCell", for: indexPath)
        cell.contentView.backgroundColor = collectionViewColors[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return self.collectionView.bounds.size  //to ensure that this works as intended set self.collectionView size be the screen size.
    }
}
