//
//  ImageLoader.swift
//  PhotoViewer
//
//  Created by 熊 炬 on 2020/10/20.
//

import SwiftUI
import Foundation
import Combine

let prefix = "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/Loading"

struct Kingfisher: Hashable, Identifiable {
    let name: String
    let photoURL: URL
    
    var id: String {
        name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static let all: [Kingfisher] = ImageSources.urls.map {
        Kingfisher(name: $0.name, photoURL: $0)
    }
}

struct ImageSources {
    static let urls: [URL] = {
        return (1...10).map { URL(string: "\(prefix)/kingfisher-\($0).jpg")! }
    }()
}

extension URL {
    var name: String {
        absoluteString.components(separatedBy: "/").last!
    }
}

class ImageLoader: ObservableObject {
    var didFinishLoad = PassthroughSubject<Data, Never>()

    init(_ url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.didFinishLoad.send(data)
            }
        }
        .resume()
    }
}
