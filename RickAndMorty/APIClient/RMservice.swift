//
//  RMservice.swift
//  RickAndMorty
//
//  Created by Kembly Muñoz valencia on 10/9/23.
//

import Foundation

/// Primary API service object to get RM data
final class RMService {
    
    /// shared singleton instance
    static let shared = RMService()
    
    /// privatized constructor
    private init() {}
    
    /// send RM API call
    /// - Parameters:
    ///   - _request: request instance
    ///   - type: the type of object we expect to get back
    ///   - completion: callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
    }
}
