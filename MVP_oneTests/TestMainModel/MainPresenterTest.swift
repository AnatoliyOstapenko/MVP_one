//
//  MainPresenterTest.swift
//  MVP_oneTests
//
//  Created by AnatoliiOstapenko on 16.03.2022.
//

import XCTest
@testable import MVP_one

// create class to test view
class MockView: MainViewProtocol {
    var titleTest: String?
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
    
    
}

class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var presenter: MainPresenter!
    var person: Person!
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        view = MockView()
        person = Person(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: person)
        
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        view = nil
        presenter = nil
        person = nil
    }
    
    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(person, "person is not nil")
        XCTAssertNotNil(presenter, "presenter is not nil")
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar")
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
    }




}
