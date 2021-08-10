//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Preetham Baliga on 04/08/2021.
//

import Foundation

internal final class FeedItemsMapper {

    private struct Root: Decodable {
        let items: [Item]

        var feed: [FeedItem] {
            return items.map({ (item) in
                item.item
            })
        }
    }

    private struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL

        enum CodingKeys: String, CodingKey {
            case id
            case description
            case location
            case image
        }

        var item: FeedItem {
            return FeedItem(id: id,
                            description: description,
                            location: location,
                            imageURL: image)
        }
    }

    internal static func map(data: Data, response: HTTPURLResponse) -> RemoteFeedLoader.Result {
        guard response.statusCode == 200, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            return .failure(.invalidData)
        }
        return .success(root.feed)
    }
}
