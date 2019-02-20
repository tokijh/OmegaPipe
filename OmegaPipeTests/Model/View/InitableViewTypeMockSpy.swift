//
//  InitableViewTypeMockSpy.swift
//  OmegaPipeTests
//
//  Created by 윤중현 on 20/02/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import OmegaPipe

class InitableViewTypeMockSpy: NSObject, ViewType {
    typealias ViewModel = InitableViewModelMock
    
    var bindInputReturnValue = Input(id: "")
    func bind() -> Input {
        return bindInputReturnValue
    }
    
    var bindOutputParameter: Output?
    func bind(output: Output) {
        bindOutputParameter = output
    }
}
