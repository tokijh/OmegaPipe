//
//  InitialType.swift
//  OmegaPipe
//
//  Created by 윤중현 on 20/02/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import Foundation
import CoreGraphics
#if os(iOS) || os(tvOS)
import UIKit.UIGeometry
#endif

public protocol Initable {
    init()
}

public extension Initable where Self: AnyObject { }
extension String: Initable { }
extension Int: Initable { }
extension Float: Initable { }
extension CGFloat: Initable { }
extension Double: Initable { }
extension NSObject: Initable { }
extension CGPoint: Initable {}
extension CGRect: Initable {}
extension CGSize: Initable {}
extension CGVector: Initable {}

#if os(iOS) || os(tvOS)
extension UIEdgeInsets: Initable {}
extension UIOffset: Initable {}
extension UIRectEdge: Initable {}
#endif
