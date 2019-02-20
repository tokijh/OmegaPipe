//
//  ViewType.swift
//  OmegaPipe
//
//  Created by 윤중현 on 19/02/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

extension AssociatedKey {
    static var viewModel: Int8 = 0
}

public protocol ViewType: AssociatedObjectStore {
    
    associatedtype ViewModel: ViewModelType
    var viewModel: ViewModel { get set }
    
    typealias Input = ViewModel.Input
    typealias Output = ViewModel.Output
    
    func bind() -> Input
    func bind(output: Output)
}

extension ViewType {
    public var viewModel: ViewModel {
        get {
            guard let viewModel: ViewModel = associatedObject(forKey: &AssociatedKey.viewModel) else {
                fatalError("ViewModel must be set before viewModel is called")
            }
            return viewModel
        }
        set(viewModel) {
            setAssociatedObject(viewModel, forKey: &AssociatedKey.viewModel)
            let input = bind()
            let output = viewModel.transform(input: input)
            bind(output: output)
        }
    }
}

extension ViewType where Self: Initable {
    public init(viewModel: ViewModel) {
        self.init()
        self.viewModel = viewModel
    }
}
