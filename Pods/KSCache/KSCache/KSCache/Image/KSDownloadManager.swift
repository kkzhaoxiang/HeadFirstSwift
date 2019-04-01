//
//  KSNetworkManager.swift
//  KSCache
//
//  Created by 疯狂的石头 on 2018/11/6.
//  Copyright © 2018 疯狂的石头. All rights reserved.
//

import Foundation

enum DownLoadError: Error {
    case error(String)
    case invalid(String)
    case unknow
}

protocol KSDownload {
    typealias DownloadTaskHandler = (Data?, DownLoadError?) -> ()
    var urlSession: URLSession { get }
    func downloadImage(withUrl url: URL?,
                       downloadTaskHandler handler: DownloadTaskHandler?)
}

extension KSDownload {
    var urlSession: URLSession {
        return URLSession.shared
    }
    
    func downloadImage(withUrl url: URL?,
                       downloadTaskHandler handler: DownloadTaskHandler?) {
                
        guard let url = url else {
            handler?( nil, .invalid("invalid url"))
            return
        }
        let request = URLRequest(url: url,
                                 cachePolicy: .reloadIgnoringLocalCacheData,
                                 timeoutInterval: 15.0)
        urlSession.dataTask(with: request) { (data, response, error) in
        
            if let error = error {
                handler?(nil, .error(error.localizedDescription))
            } else {
                
                if let response = response as? HTTPURLResponse {
                    
                    if response.statusCode == 200 {
                        handler?(data, nil)
                    } else {
                        handler?(nil, .unknow)
                    }
                } else {
                    handler?(nil, .unknow)
                }
            }
        }.resume()
    }
}

struct KSDownloadManager: KSDownload {
    static let manager = KSDownloadManager()
    var cache: KSMemoryCache!
    
    private init() {
        cache = KSMemoryCache()
    }
}
