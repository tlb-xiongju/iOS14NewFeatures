//
//  ImageLoader.swift
//  PhotoViewer
//
//  Created by 熊 炬 on 2020/10/20.
//

import SwiftUI
import Foundation
import Combine

struct ImageSources {
    static let urls: [URL] = {
        let prefix = "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/Loading"
        return (1...10).map { URL(string: "\(prefix)/kingfisher-\($0).jpg")! }
    }()
}

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(_ url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        .resume()
    }
}
