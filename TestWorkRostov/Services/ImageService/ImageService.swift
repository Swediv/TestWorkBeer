//
//  ImageService.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import UIKit

class ImageService {
    private static let cache = NSCache<NSString, UIImage>()
    
    @discardableResult
    static func downloadImage(from url: URL, completion: @escaping (_ image: UIImage?) -> Void) -> URLSessionDataTask {
        var downloadedImage: UIImage?
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                downloadedImage = UIImage(data: data)
            }
            if downloadedImage != nil {
                cache.setObject(downloadedImage!, forKey: url.absoluteString as NSString)
            }
            DispatchQueue.main.async {
                completion(downloadedImage)
            }
        }
        task.resume()
        
        return task
    }
    
    @discardableResult
    static func getImage(from url: URL, completion: @escaping (_ image: UIImage?) ->Void) -> URLSessionDataTask? {
        if let image = cache.object(forKey: url.absoluteString as NSString) {
            completion(image)
            
            return nil
        }
        
        return downloadImage(from: url, completion: completion)
    }
}
