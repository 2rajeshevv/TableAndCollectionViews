//
//  ViewController.swift
//  TableAndCollectionViews
//
//  Created by Saanvi Shingarwad on 03/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedController: UISegmentedControl!
    
    private let tableController = TableViewController()
    private let collectionController = CollectionViewController()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(scrollView)
        segmentedController.addTarget(self, action: #selector(didTapSegmentControll(didSroll:)), for: .valueChanged)
        
        addTableAndCollectionViews()
    }

    @objc func didTapSegmentControll(didSroll: UIScrollView) {
        print("segment clicked")
        if segmentedController.selectedSegmentIndex == 0 {
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        } else {
            scrollView.setContentOffset(CGPoint(x: view.frame.size.width, y: 0), animated: true)
        }
    }
    
    private func addTableAndCollectionViews() {
        
        addChild(tableController)
        scrollView.addSubview(tableController.view)
        tableController.view.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        tableController.didMove(toParent: self)
        
        addChild(collectionController)
        scrollView.addSubview(collectionController.view)
        collectionController.view.frame = CGRect(x: view.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        collectionController.didMove(toParent: self)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: view.frame.size.width * 2, height: scrollView.frame.size.height)
        scrollView.frame = CGRect(x: 0, y: 20, width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.bottom - 20)
    }
}


extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
