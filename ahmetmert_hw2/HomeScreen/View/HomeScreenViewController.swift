//
//  HomeScreenViewController.swift
//  ahmetmert_hw2
//
//  Created by Ahmet Mert ÖZ on 14.05.2023.
//

import UIKit
import AhmertNetworkManager

class HomeScreenViewController: UIViewController {

    let viewModel = HomeViewModel()
    
    @IBOutlet private var newsCollectionView: UICollectionView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        newsCollectionView.backgroundColor = .none
        newsCollectionView.alpha = 0
        activityIndicator.startAnimating()

        let newsCVCell = UINib(nibName: "NewsCollectionViewCell", bundle: nil)
        newsCollectionView.register(newsCVCell, forCellWithReuseIdentifier: "NewsCollectionViewCell")

        self.view.backgroundColor = .systemYellow
        
        viewModel.getHomeItems { errorMessage in
            if let errorMessage = errorMessage {
                print("error : \(errorMessage)")
            }
            print("bişi oldu")
            print("sonuclar : \(String(describing: self.viewModel.result))")
            
            DispatchQueue.main.async {
                self.newsCollectionView.alpha = 1
                self.view.backgroundColor = .systemYellow
                self.activityIndicator.stopAnimating()
                self.activityIndicator.alpha = 0
                self.newsCollectionView.reloadData()
            }
        }
    }
    
    public override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape,
            let layout = newsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                layout.invalidateLayout()
            }        } else if UIDevice.current.orientation.isPortrait,
            let layout = newsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                layout.invalidateLayout()
            }
        }
    }
    
}


extension HomeScreenViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.result?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        
        cell.setUp(model: viewModel.result?.results?[indexPath.row] ?? ResultNews(section: nil, subsection: nil, title: nil, abstract: nil, url: nil, uri: nil, byline: nil, item_type: nil, updated_date: nil, created_date: nil, published_date: nil, material_type_facet: nil, kicker: nil, des_facet: nil, org_facet: nil, per_facet: nil, geo_facet: nil, multimedia: nil, short_url: nil))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: newsCollectionView.contentSize.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedNews = viewModel.result?.results?[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.newsModel = selectedNews
        detailVC.modalPresentationStyle = .fullScreen
        detailVC.modalTransitionStyle = .crossDissolve
        self.present(detailVC, animated: true)
    }
    
}
