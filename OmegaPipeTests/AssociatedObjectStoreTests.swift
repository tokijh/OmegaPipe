//
//  AssociatedObjectStoreTests.swift
//  OmegaPipeTests
//
//  Created by 윤중현 on 18/02/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import Quick
import Nimble
@testable import OmegaPipe

class AssociatedObjectStoreStub: AssociatedObjectStore {
    var deinitClosure: (() -> Void)?
    deinit {
        deinitClosure?()
    }
}

class ObjectStub {
    var deinitClosure: (() -> Void)?
    deinit {
        deinitClosure?()
    }
}

class AssociatedObjectStoreTests: QuickSpec {
    override func spec() {
        context("when associate object") {
            it("is set object") {
                // given
                let store = AssociatedObjectStoreStub()
                let object = "Object"
                var key = "object"

                // when
                store.setAssociatedObject(object, forKey: &key)

                // then
                let associatedObject: String = store.associatedObject(forKey: &key, default: "default")
                expect(associatedObject).to(equal(object))
            }
            context("when get associated object") {
                it("is not set object") {
                    // given
                    let store = AssociatedObjectStoreStub()
                    var key = "object"

                    // when

                    // then
                    let associatedObject: String = store.associatedObject(forKey: &key, default: "default")
                    expect(associatedObject).to(equal("default"))
                }
            }
        }
        context("when deinit") {
            it("is deinited") {
                // given
                var store: AssociatedObjectStoreStub? = AssociatedObjectStoreStub()
                var object: ObjectStub? = ObjectStub()
                var key = "object"
                var isStoreDeallocated = false
                var isObjectDeallocated = false
                store?.deinitClosure = { isStoreDeallocated = true }
                object?.deinitClosure = { isObjectDeallocated = true }
                store?.setAssociatedObject(object, forKey: &key)

                // when
                store = nil
                object = nil

                // then
                expect(isStoreDeallocated).to(beTrue())
                expect(isObjectDeallocated).to(beTrue())
            }
        }
    }
}
