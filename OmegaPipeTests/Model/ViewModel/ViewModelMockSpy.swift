//
//  ViewModelMockSpy.swift
//  OmegaPipeTests
//
//  Created by 윤중현 on 20/02/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

class ViewModelMockSpy: ViewModelMock {
    required init() {
        transformedOutput = Output(id: "Output")
    }
    
    init(transformed output: Output) {
        self.transformedOutput = output
    }
    
    let transformedOutput: Output
    var transformParameters: (Input)? = nil
    
    override func transform(input: Input) -> Output {
        transformParameters = input
        return transformedOutput
    }
}
