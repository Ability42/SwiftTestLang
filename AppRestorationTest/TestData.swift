//
//  TestData.swift
//  AppRestorationTest
//
//  Created by Stepan Paholyk on 4/2/17.
//  Copyright © 2017 Stepan Paholyk. All rights reserved.
//

import UIKit

class TestData: NSObject {
    
    var itemImage: UIImage?
    var itemPrice: Double?
    var itemName: String?
    var imageStringPath: String?
    
    var imageUrlPath: URL {
        get { return URL(string: self.imageStringPath!)! }
    }
    
    var imageSize: CGSize? {
        get { return self.itemImage?.size }
        set { self.imageSize = newValue }
    }
    
    init(response: [String : Any]) {

    }
    


}
