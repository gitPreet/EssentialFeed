//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Preetham Baliga on 31/07/2021.
//

import XCTest

class RemoteFeedLoader {

    func load() {
        HTTPClient.shared.get(from: URL(string: "http://a-given-url.com")!)
    }
}

class HTTPClient {

    static var shared = HTTPClient()

    func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    //we have started moving test logic to a seperate type. So production code is more generic.

    var requestedURL: URL?  //HTTPClient will be production code, I do not want this requestedURL in production.
    //It is only used for test purposes.

    override func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_initDoesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestsDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()

        sut.load()

        XCTAssertNotNil(client.requestedURL)
    }
}
