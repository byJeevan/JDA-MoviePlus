//
//  ImageLoader.swift
//  SwiftUIMovie
//
//  Created by Jeevan on 23/08/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import Combine
import SwiftUI
import UIKit

final class ImageData: ObservableObject {
    
    private static let imageCache = NSCache<AnyObject, AnyObject>()
    private let movieURL: URL
    
    @Published var image: UIImage? = nil
    
    init(movieURL: URL) {
        self.movieURL = movieURL
    }
    
    public func downloadImage() {
        let urlString = movieURL.absoluteString
        
        if let imageFromCache = ImageData.imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            do {
                let data = try Data(contentsOf: self.movieURL)
                guard let image = UIImage(data: data) else {
                    return
                }
                ImageData.imageCache.setObject(image, forKey: urlString  as AnyObject)
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}


