//
//  StateRelaySpy.swift
//  OmegaPipeTests
//
//  Created by 윤중현 on 20/02/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import OmegaPipe
import RxSwift

class StateRelaySpy<Element>: StateRelay<Element> {
    var acceptParameter: Element?
    
    public override func accept(_ event: Element) {
        acceptParameter = event
        super.accept(event)
    }
    
    var subscribeParameter: Any?
    public override func subscribe<O>(_ observer: O) -> Disposable where Element == O.E, O : ObserverType {
        subscribeParameter = observer
        return super.subscribe(observer)
    }
}
