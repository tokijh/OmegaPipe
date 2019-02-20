//
//  ViewTypeTests.swift
//  OmegaPipeTests
//
//  Created by 윤중현 on 20/02/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import Quick
import Nimble
import OmegaPipe

class ViewTypeTests: QuickSpec {
    override func spec() {
        context("when not init by init()") {
            it("is fatalError") {
                // given
                let view: InitableViewTypeMockSpy = InitableViewTypeMockSpy()
                
                expect { _ = view.viewModel } // when
                    .to(throwAssertion()) // then
            }
        }
        context("when init by init(viewModel:)") {
            var viewModel: InitableViewModelMock!
            var view: InitableViewTypeMockSpy!
            beforeEach {
                // given
                viewModel = InitableViewModelMock()
                view = InitableViewTypeMockSpy(viewModel: viewModel)
            }
            it("is bind return value equal to bindInputReturnValue") {
                // given
                let input: InitableViewTypeMockSpy.Input = .init(id: "Bind Input")
                view.bindInputReturnValue = InitableViewModelMock.Input(id: "Bind Input")
                let output: InitableViewTypeMockSpy.Output
                
                // when
                output = view.bind()
                
                // then
                expect(output).to(equal(input))
            }
            it("is bind(output:) input equal to bindOutputParameter") {
                // given
                let input: InitableViewTypeMockSpy.Output = .init(id: "Bind Output")
                
                // when
                view.bind(output: input)
                
                // then
                expect(view.bindOutputParameter).to(equal(input))
            }
        }
    }
}
