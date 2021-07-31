//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Preetham Baliga on 31/07/2021.
//

import XCTest

class RemoteFeedLoader {

    let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func load() {
        client.get(from: URL(string: "http://a-given-url.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    //we have started moving test logic to a seperate type. So production code is more generic.

    var requestedURL: URL?  //HTTPClient will be production code, I do not want this requestedURL in production.
    //It is only used for test purposes.

    func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_initDoesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestsDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)

        sut.load()

        XCTAssertNotNil(client.requestedURL)
    }
}
