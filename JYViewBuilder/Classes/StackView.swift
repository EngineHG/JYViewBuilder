//
//  StackView.swift
//  ViewContentBuilder
//
//  Created by CodeMan on 2021/5/7.
//

import UIKit

//MARK: - 纵向布局
public class VStack: UIStackView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - 横向布局
public class HStack: UIStackView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension UIStackView {
    
    /// UIStackView初始化
    /// - Parameters:
    ///   - spacing: 控件间隔
    ///   - alignment: 布局类型
    ///   - content: 子控件
    @discardableResult
    convenience init(spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, @ViewContentBuilder content: ViewContentBlock) {
        self.init(arrangedSubviews: content())
        self.spacing = spacing
        self.alignment = alignment
    }
    
    ///设置distribution
    @discardableResult
    func distribution(_ d: UIStackView.Distribution) -> Self {
        self.distribution = d
        return self
    }
}

//MARK: - ViewAddable
public protocol ViewAddable {
    ///View添加子控件方法
    @discardableResult
    func add(@ViewContentBuilder content: ViewContentBlock) -> Self
}

extension UIView: ViewAddable{}

extension ViewAddable where Self: UIView {
    
    public func add(@ViewContentBuilder content: ViewContentBlock) -> Self{
        content().forEach{
            self.addSubview($0)
        }
        return self
    }
}
extension ViewAddable where Self: UIStackView {
    
    public func add(@ViewContentBuilder content: ViewContentBlock) -> Self{
        content().forEach{
            self.addArrangedSubview($0)
        }
        return self
    }
}
