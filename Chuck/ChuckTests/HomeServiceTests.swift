//
//  HomeServiceTests.swift
//  ChuckTests
//
//  Created by Enrico Sousa Gollner on 24/05/23.
//

import XCTest
import OHHTTPStubs
@testable import Chuck

final class HomeServiceTests: XCTestCase {
    
    var homeService: HomeService!

    override func setUpWithError() throws {
        homeService = HomeService()
    }

    override func tearDownWithError() throws {
        homeService = nil  // desalocando da memória
    }

    func testGetHomeSuccess() {
        let expectation = self.expectation(description: "Categories fetched")
        
        homeService.getHome { result in
            switch result {
            case .success(let success):
                XCTAssertNotNil(success, "Success não pode ser nil!")
                XCTAssertGreaterThan(success.count, 0, "A categoria deveria ser >= 0")
                expectation.fulfill()
            case .failure:
                XCTFail("A request não pode cair no caso de failure")  // É como se fosse o fatal error
            }
        }
        waitForExpectations(timeout: 10)
    }
    
    func testGetHomeFailure() {
        let expectation = self.expectation(description: "fetch categories failure")
        
        HTTPStubs.stubRequests { request in
            return request.url?.absoluteString.contains("https://api.chucknorris.io/jokes/categories") ?? false
        } withStubResponse: { _ in
            return HTTPStubsResponse(error: NSError(domain: "com.test.error", code: 404))
        }

        
        homeService.getHome { result in
            switch result {
            case .success:
                XCTFail("A request não pode cair no caso de success")
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10)
        HTTPStubs.removeAllStubs()  // desalocar da memória
    }
    
}
