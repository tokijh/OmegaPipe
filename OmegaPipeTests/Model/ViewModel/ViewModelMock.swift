//
//  ViewModelMock.swift
//  OmegaPipeTests
//
//  Created by 윤중현 on 20/02/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import OmegaPipe

class ViewModelMock: ViewModelType {
    typealias State = ViewModelConfigMock
    typealias Input = ViewModelConfigMock
    typealias Output = ViewModelConfigMock
    
    required init() { }
    
    func transform(input: Input) -> Output {
        return Output(id: "")
    }
}
