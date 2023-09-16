//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Kembly Muñoz valencia on 13/9/23.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
    
    var text: String {
          switch self {
          case .alive, .dead:
              return rawValue
          case .unknown:
              return "Unknown"
          }
      }

    ///troubleshooting that is not showing in the video
    init(from decoder: Decoder) throws {
           let container = try decoder.singleValueContainer()
           let rawStatus = try container.decode(String.self)

           switch rawStatus {
           case "Alive":
               self = .alive
           case "Dead":
               self = .dead
           default:
               self = .unknown
           }
       }

    ///finish here
}
 
