//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Preetham Baliga on 31/07/2021.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
