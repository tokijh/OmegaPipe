//
//  ViewModelType.swift
//  OmegaPipe
//
//  Created by 윤중현 on 19/02/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

extension AssociatedKey {
    static var state: Int8 = 0
}

public protocol ViewModelType: AssociatedObjectStore {
    
    init()
    
    /// A State represents the current state of a ViewModel.
    associatedtype State
    var state: StateRelay<State> { get }
    var currentState: State { get }

    /// A Input represents user actions from View
    associatedtype Input
    /// An Output represents that a view should be bind from ViewModel
    associatedtype Output
    
    /// tranform to Output from Input for binding with View
    /// - warning: It's not recommended to call this method directly.
    func transform(input: Input) -> Output
}

extension ViewModelType {
    public init(state: State) {
        self.init()
        setAssociatedObject(StateRelay<State>(value: state), forKey: &AssociatedKey.state)
    }
    
    public var state: StateRelay<State> {
        get {
            guard let state: StateRelay<State> = associatedObject(forKey: &AssociatedKey.state) else {
                fatalError("State must be init by init(state: State)")
            }
            return state
        }
    }
    
    public var currentState: State {
        return state.value
    }
}

extension ViewModelType where State: Initable {
    public var state: StateRelay<State> {
        get {
            if let state: StateRelay<State> = associatedObject(forKey: &AssociatedKey.state) {
                return state
            }
            let state = StateRelay<State>(value: State())
            setAssociatedObject(state, forKey: &AssociatedKey.state)
            return state
        }
    }
}
