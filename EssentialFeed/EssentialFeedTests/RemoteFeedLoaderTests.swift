//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Preetham Baliga on 31/07/2021.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_initDoesNotRequestDataFromURL() {
        _ = RemoteFeedLoader()
        let client = HTTPClient()

        XCTAssertNil(client.requestedURL)
    }
}
