//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Preetham Baliga on 31/07/2021.
//

import XCTest

class RemoteFeedLoader {

    func load() {
        HTTPClient.shared.requestedURL = URL(string: "http://a-given-url.com")
    }
}

class HTTPClient {

    static let shared = HTTPClient()

    private init() {}

    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_initDoesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestsDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()

        sut.load()

        XCTAssertNotNil(client.requestedURL)
    }
}
