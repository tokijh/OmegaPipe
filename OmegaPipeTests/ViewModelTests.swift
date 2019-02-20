//
//  ViewModelTests.swift
//  OmegaPipeTests
//
//  Created by 윤중현 on 20/02/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import Quick
import Nimble
import OmegaPipe

class ViewModelTypeTests: QuickSpec {
    override func spec() {
        context("when initation") {
            context("when State is not Initable") {
                context("when not init by init(state:)") {
                    it("is fatalError") {
                        // given
                        let viewModel: ViewModelMockSpy = ViewModelMockSpy()
                        
                        expect { _ = viewModel.state } // when
                            .to(throwAssertion()) // then
                    }
                }
                context("when init by init(state:)") {
                    it("is state equal to input") {
                        // given
                        let input = ViewModelConfigMock(id: "State")
                        let viewModel: ViewModelMockSpy = ViewModelMockSpy(state: input)
                        
                        expect(viewModel.state.value) // when
                            .to(equal(input)) // then
                    }
                }
            }
            context("when State is Initable") {
                context("when not init by init(state:)") {
                    it("is state equal to input") {
                        // given
                        let viewModel: InitableViewModelMock = InitableViewModelMock()
                        
                        expect { _ = viewModel.state } // when
                            .toNot(throwAssertion()) // then
                    }
                }
                context("when init by init(state:)") {
                    it("is state equal to input") {
                        // given
                        let input: InitableViewModelMock.State = "Input"
                        let viewModel: InitableViewModelMock = InitableViewModelMock(state: input)
                        
                        expect(viewModel.state.value) // when
                            .to(equal(input)) // then
                    }
                }
            }
        }
        context("when transform") {
            it("is transformParameters equal to input") {
                // given
                let input = ViewModelConfigMock(id: "Input")
                let viewModel = ViewModelMockSpy(state: ViewModelConfigMock(id: ""))
                
                // when
                _ = viewModel.transform(input: input)
                
                // then
                expect(viewModel.transformParameters).to(equal(input))
            }
            it("is viewModel.transformedOutput equal to inputed transformedOutput") {
                // given
                let inputedTransformedOutput = ViewModelConfigMock(id: "Output")
                let input = ViewModelConfigMock(id: "")
                let viewModel = ViewModelMockSpy(transformed: inputedTransformedOutput)
                
                // when
                let transformedOutput = viewModel.transform(input: input)
                
                // then
                expect(transformedOutput).to(equal(inputedTransformedOutput))
            }
        }
        context("when accept") {
            it("is correct current State") {
                // given
                var state = ViewModelConfigMock(id: "inital")
                let viewModel: ViewModelMock = ViewModelMock(state: state)
                
                // when
                state.id = "when"
                viewModel.state.accept(state)
                
                // then
                expect(viewModel.currentState).to(equal(state))
            }
        }
    }
}
