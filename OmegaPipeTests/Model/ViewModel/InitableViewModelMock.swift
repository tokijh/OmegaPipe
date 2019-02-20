//
//  InitableViewModelMock.swift
//  OmegaPipeTests
//
//  Created by 윤중현 on 20/02/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import OmegaPipe

class InitableViewModelMock: ViewModelType {
    typealias State = String
    typealias Input = ViewModelConfigMock
    typealias Output = ViewModelConfigMock
    
    required init() {
        transformedOutput = Output(id: "Output")
    }
    
    init(transformed output: Output) {
        self.transformedOutput = output
    }
    
    let transformedOutput: Output
    var transformParameters: (Input)? = nil
    
    func transform(input: Input) -> Output {
        transformParameters = input
        return transformedOutput
    }
}
