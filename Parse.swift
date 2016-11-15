//
//  Parse.swift
//  SwiftyTwitter
//
//  Created by Kirill Khlopko on 11/11/16.
//  Copyright © 2016 Kirill Khlopko. All rights reserved.
//
import Foundation

// MARK: - Parse function
public func parse<In, Out: Convertible>(_ input: In?) -> Out {
    return Out.cast(input)
}

// MARK: - Convertible
public protocol Convertible {
    static func cast<T>(_ input: T) -> Self
}

extension String: Convertible {
    
    public static func cast<T>(_ input: T) -> String {
        switch input {
        case let str as String:
            return str
        case let conv as CustomStringConvertible:
            return conv.description
        default:
            return ""
        }
    }
}

extension Int: Convertible {
    
    public static func cast<T>(_ input: T) -> Int {
        if let int = input as? Int {
            return int
        }
        return 0
    }
}

extension Int64: Convertible {
    
    public static func cast<T>(_ input: T) -> Int64 {
        switch input {
        case let int as Int:
            return Int64(int)
        case let int64 as Int64:
            return int64
        default:
            return 0
        }
    }
}

extension Double: Convertible {
    
    public static func cast<T>(_ input: T) -> Double {
        if let double = input as? Double {
            return double
        }
        return 0.0
    }
}

extension Array: Convertible {
    
    public static func cast<T>(_ input: T) -> Array {
        if let array = input as? [Element] {
            return array
            }
        return []
    }
}

extension Bool: Convertible {
    
    public static func cast<T>(_ input: T) -> Bool {
        if let boolean = input as? Bool {
            return boolean
        }
        return false
    }
}

extension Dictionary: Convertible {
    
    public static func cast<T>(_ input: T) -> Dictionary {
        if let dict = input as? Dictionary {
            return dict
        }
        return [:]
    }
}
