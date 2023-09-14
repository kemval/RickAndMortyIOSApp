//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Kembly Muñoz valencia on 10/9/23.
//

import UIKit

/// controler to show and search fro characters

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        
        let request = RMRequest(
            endpoint: .character,
            pathComponents: ["1"],
            queryParameters: [URLQueryItem(name: "name", value: "rick"),
                              URLQueryItem(name: "status", value: "Alive")
                             ]
        )
        print(request.url)
        
        
       
    }
    
    

}
