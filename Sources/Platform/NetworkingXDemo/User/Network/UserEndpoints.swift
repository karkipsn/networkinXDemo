//
//  File.swift
//  
//
//  Created by Suresh Chamling on 7/14/20.
//

import Foundation
import NetworkingX

struct UserEndpoints {
    
    static func authenticateUser(requestDTO: UserAuthenticationRequestDTO) -> Endpoint<UserAuthenticationResponseDTO> {
        return Endpoint(path: "pathtoLogin",
                        method: .post,
                        bodyParamatersEncodable: requestDTO
        )
    }
    
   
}
