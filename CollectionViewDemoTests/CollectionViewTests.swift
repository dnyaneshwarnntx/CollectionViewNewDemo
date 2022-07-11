//
//  CollectionViewTests.swift
//  CollectionViewDemoTests
//
//  Created by Dnyaneshwar on 11/07/22.
//
@testable import CollectionViewDemo
import XCTest
import Foundation

class CollectionViewTests: XCTestCase {


    func test_CollectionView() throws {
        let collectionViewC = ViewController(nibName: nil, bundle: nil)
        let cell = collectionViewC.collectionView?.cellForItem(at: IndexPath(item: 0, section: 1)) as? MyCollectionViewCell
        XCTAssertNil(cell)
    }
//    func test_PinchTest() throws
//    {
//        let collectionViewC = ViewController(nibName: nil, bundle: nil)
//         let cell = collectionViewC.collectionView?.cellForItem(at: IndexPath(item: 0, section: 1)) as? MyCollectionViewCell
//        collectionViewC.pinchGestureCallBack(scale: 1.0, mode: "H", cell: cell!)
//
//    }

 
}
