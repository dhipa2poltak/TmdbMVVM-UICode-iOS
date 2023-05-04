//
//  Box.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation

public class Box<T> {
    public typealias Listener = (T) -> Void
    public var listener: Listener?

    public var value: T {
        didSet {
            listener?(value)
        }
    }

    public init(_ value: T) {
        self.value = value
    }

    public func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
