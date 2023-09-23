//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Kembly Muñoz valencia on 10/9/23.
//

import Foundation


/// obejct that rerpresents a single API call
final class RMRequest {
    
    /// API Constants
    private struct Constants{
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    /// Desired endpoint
    private let endpoint: RMEndpoint
    /// path component for API if any
    private let pathComponents: [String]
    /// query arguments for API if any
    private let queryParameters: [URLQueryItem]
    /// constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty{
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        if !pathComponents.isEmpty{
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        return string
    }
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    /// Desired http method
    public let httpMethod = "GET"
    
    /// construct request
    /// - Parameters:
    ///   - endpoint: target endpoint
    ///   - pathComponents: collection of path components
    ///   - queryParameters: collection of query parameters
    public init(
        endpoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    convenience init? (url:URL){
        let string = url.absoluteString
        if !string.contains(Constants.baseUrl){
            return nil
        }
        
        let trimmed = string.replacingOccurrences(of: Constants.baseUrl+"/", with: "")
        if trimmed.contains("/"){
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty{
                let endpointString = components[0]
                if let rmEndpoint = RMEndpoint(rawValue: endpointString){
                    self.init(endpoint: rmEndpoint)
                    return
                }
            }
            
        } else if trimmed.contains("?"){
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2{
                let endpointString = components[0]
                let queryItemsString = components [1]
                let queryItems: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap({
                    guard $0.contains("=") else {
                        return nil
                    }
                    
                    let parts = $0.components(separatedBy: "=")
                    
                    return URLQueryItem(
                        name: parts[0],
                        value: parts[1]
                    )
                })
                if let rmEndpoint = RMEndpoint(rawValue: endpointString){
                    self.init(endpoint: rmEndpoint, queryParameters: queryItems)
                    return
                }
            }
            
        }
        
        return nil
    }
    
}

extension RMRequest{
    static let listCharactersRequests = RMRequest(endpoint: .character)
}

