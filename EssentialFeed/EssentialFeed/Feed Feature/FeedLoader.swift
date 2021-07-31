//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Preetham Baliga on 31/07/2021.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
