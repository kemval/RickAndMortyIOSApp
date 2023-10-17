//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Kembly Muñoz valencia on 12/9/23.
//

import Foundation

///// represents unique API endpoint
//@frozen enum RMEndpoint: String {
//    ///  end point to get character info
//    case character
//    ///  end point to get location info
//    case location
//    ///  end point to get episode info
//    case episode
//
//}


/// represents unique API endpoint
@frozen enum RMEndpoint: String, CaseIterable{
    ///  end point to get character info
    case character
    ///  end point to get location info
    case location
    ///  end point to get episode info
    case episode
}
