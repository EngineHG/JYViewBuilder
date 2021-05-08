//
//  ViewContentBuilder.swift
//  ViewContentBuilder
//
//  Created by CodeMan on 2021/5/7.
//

import UIKit

public typealias ViewContentBlock = () -> [UIView]

@resultBuilder public struct ViewContentBuilder {
    
    public static func buildBlock(_ components: ViewContentType...) -> ViewContentType {
        
        ViewContent(contents: components.flatMap{ $0.contents })
    }
    
    public static func buildArray(_ components: [ViewContentType]) -> ViewContentType {
        
        ViewContent(contents: components.flatMap{ $0.contents })
    }
    
    public static func buildFinalResult(_ component: ViewContentType) -> [UIView] {
        
        component.contents
    }
    
}

public protocol ViewContentType {
    ///承载内容
    var contents: [UIView] {get}
}

extension UIView: ViewContentType {
    public var contents: [UIView] {
        return [self]
    }
}

struct ViewContent: ViewContentType {
    var contents: [UIView]
}
