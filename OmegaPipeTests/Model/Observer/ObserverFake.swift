//
//  ObserverFake.swift
//  OmegaPipeTests
//
//  Created by 윤중현 on 20/02/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import RxSwift

class ObserverFake<E> : ObserverType, Equatable {
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    func on(_ event: Event<E>) { }
    
    public static func == (lhs: ObserverFake<E>, rhs: ObserverFake<E>) -> Bool {
        return lhs.id == rhs.id
    }
}
