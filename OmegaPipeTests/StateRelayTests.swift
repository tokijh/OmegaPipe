//
//  StateRelayTests.swift
//  CocoaBookTests
//
//  Created by 윤중현 on 18/02/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import OmegaPipe

class StateRelayTests: QuickSpec {
    override func spec() {
        context("when subscribed") {
            // given
            var relay: StateRelaySpy<Int>!
            var disposeBag = DisposeBag()
            beforeEach {
                relay = StateRelaySpy(value: 0)
                disposeBag = DisposeBag()
            }
            it("is called relay.onNext when initial") {
                // given
                let input = 10
                var output: Int?
                relay = StateRelaySpy(value: input)
                
                // when
                relay.subscribe(onNext: { output = $0 })
                    .disposed(by: disposeBag)
                
                // then
                expect(output).to(equal(input))
            }
            it("is subscribeParameter equal to input") {
                // given
                let input = ObserverFake<Int>(id: "Fake")
                
                // when
                _ = relay.subscribe(input)
                
                // then
                expect(relay.subscribeParameter as? ObserverFake<Int>).to(equal(input))
            }
        }
        context("when accept") {
            // given
            var relay: StateRelay<Int>!
            var disposeBag = DisposeBag()
            beforeEach {
                relay = StateRelay(value: 0)
                disposeBag = DisposeBag()
            }
            it("is called relay.onNext") {
                // given
                let inputs: [Int] = [20, 30, 40]
                var outputs: [Int] = []
                relay
                    .skip(1) // skip initial value. this case tested on 'when subscribed'
                    .subscribe(onNext: { outputs.append($0) })
                    .disposed(by: disposeBag)
                
                // when
                inputs.forEach({ relay.accept($0) })
                
                // then
                expect(outputs).to(equal(inputs))
            }
            it("is relay.value equal to input") {
                // given
                let inputs: [Int] = [20, 30, 40]
                var outputs: [Int] = []
                
                // when
                inputs.forEach({
                    relay.accept($0)
                    outputs.append(relay.value)
                })
                
                // then
                expect(outputs).to(equal(inputs))
            }
        }
        context("when set value") {
            it("is called accept") {
                // given
                let relay = StateRelaySpy<Int>(value: 0)
                let inputs: [Int] = [20, 30, 40]
                var outputs: [Int?] = []
                
                // when
                inputs.forEach({
                    relay.value = $0
                    outputs.append(relay.acceptParameter)
                })
                
                // then
                expect(outputs).to(equal(inputs))
            }
        }
    }
}
