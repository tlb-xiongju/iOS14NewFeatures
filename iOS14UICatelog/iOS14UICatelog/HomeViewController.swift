//
//  ViewController.swift
//  iOS14UICatelog
//
//  Created by 熊 炬 on 2020/10/19.
//

import UIKit

class HomeViewController: UICollectionViewController {
    enum Section {
        case main
    }
    
    class CollectionItem: Identifiable, Hashable {
        let title: String
        let storyboardName: String?
        
        init(title: String, storyboardName: String? = nil) {
            self.title = title
            self.storyboardName = storyboardName
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func == (lhs: CollectionItem, rhs: CollectionItem) -> Bool {
            lhs.id == rhs.id
        }
    }
    
    private lazy var collectionItems: [CollectionItem] = {
        [
            CollectionItem(title: "UIButton + Menu", storyboardName: "Button"),
            CollectionItem(title: "UIBarButtonItem + Menu", storyboardName: "BarButtonItem"),
            CollectionItem(title: "UIColorPicker", storyboardName: "ColorPicker"),
            CollectionItem(title: "UIFontPicker", storyboardName: "FontPicker"),
            CollectionItem(title: "DatePicker", storyboardName: "DatePicker"),
            CollectionItem(title: "ImagePicker", storyboardName: "ImagePicker"),
            CollectionItem(title: "Album Access", storyboardName: "AlbumAccess")
        ]
    }()
    
    private lazy var layout = UICollectionViewCompositionalLayout.list(using: .init(appearance: .insetGrouped))
    private lazy var dataSource = UICollectionViewDiffableDataSource<Section, CollectionItem>(collectionView: collectionView) { cv, idx, item in
        cv.dequeueConfiguredReusableCell(using: UICollectionView.CellRegistration<UICollectionViewListCell, CollectionItem> { cell, indexPath, mItem in
            var content = UIListContentConfiguration.cell()
            content.text = mItem.title
            cell.contentConfiguration = content
            
            cell.accessories = [.disclosureIndicator()]
        }, for: idx, item: item)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.collectionViewLayout = layout
        
        var snapshot = NSDiffableDataSourceSectionSnapshot<CollectionItem>()
        snapshot.append(collectionItems)
        dataSource.apply(snapshot, to: .main, animatingDifferences: false)
    }
}

extension HomeViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if let storyboardName = item.storyboardName {
            let exampleStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
            if let exampleViewController = exampleStoryboard.instantiateInitialViewController() {
                navigationController?.pushViewController(exampleViewController, animated: true)
            }
        }
    }
}

