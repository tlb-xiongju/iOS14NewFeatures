//
//  AlbumAccessViewController.swift
//  iOS14UICatelog
//
//  Created by 熊 炬 on 2020/10/19.
//

import UIKit
import Photos

class AlbumAccessViewController: UICollectionViewController {
    enum Section {
        case main
    }
    
    class AlbumItem: Identifiable, Hashable {
        let asset: PHAsset
        init(asset: PHAsset) {
            self.asset = asset
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func == (lhs: AlbumItem, rhs: AlbumItem) -> Bool {
            lhs.id == rhs.id
        }
    }
    
    private lazy var layout: UICollectionViewCompositionalLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }()
    
    private lazy var dataSource = UICollectionViewDiffableDataSource<Section,AlbumItem>(collectionView: collectionView) { cv, idx, item in
        cv.dequeueConfiguredReusableCell(using: UICollectionView.CellRegistration<AlbumAccessCell, AlbumItem> { cell, indexPath, mItem in
            
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            options.deliveryMode = .highQualityFormat
            
            PHImageManager.default().requestImage(for: mItem.asset, targetSize: .init(width: 200, height: 200), contentMode: .aspectFill, options: options) { image, info in
                guard let image = image else { return }
                cell.imageView.image = image
            }
            
            
        }, for: idx, item: item)
    }
    
    private lazy var fetchResult: PHFetchResult<PHAsset> = {
        let options = PHFetchOptions()
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        return PHAsset.fetchAssets(with: options)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.collectionViewLayout = layout
        
        var snapshot = NSDiffableDataSourceSectionSnapshot<AlbumItem>()
        var assets: [PHAsset] = []
        
        fetchResult.enumerateObjects { asset, index, stop in
            assets.append(asset)
        }
        
        snapshot.append(assets.map(AlbumItem.init(asset:)))
    }
}
