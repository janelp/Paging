//
// HopsIngredient.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct HopsIngredient: Codable {

    public var name: String?
    public var add: String?
    public var attribute: String?
    public var amount: Amount?

    public init(name: String?, add: String?, attribute: String?, amount: Amount?) {
        self.name = name
        self.add = add
        self.attribute = attribute
        self.amount = amount
    }

}