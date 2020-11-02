//
//  Birds.swift
//  BirdsViewer
//
//  Created by 熊 炬 on 2020/11/02.
//

import Foundation
import SwiftUI

struct Bird {
    let name: String
    let img: UIImage
    
    static let alice =  Bird(name: "ALICE",   img: #imageLiteral(resourceName: "Image-1"))
    static let bobby =  Bird(name: "BOBBY",   img: #imageLiteral(resourceName: "Image-6"))
    static let clark =  Bird(name: "CLARK",   img: #imageLiteral(resourceName: "Image-5"))
    static let daniel = Bird(name: "DANIEL",  img: #imageLiteral(resourceName: "Image-3"))
    static let eric =   Bird(name: "ERIC",    img: #imageLiteral(resourceName: "Image-4"))
    static let frank =  Bird(name: "FRANK",   img: #imageLiteral(resourceName: "Image-5"))
    
    static let all: [Bird] = [alice, bobby, clark, daniel, eric, frank]
}
