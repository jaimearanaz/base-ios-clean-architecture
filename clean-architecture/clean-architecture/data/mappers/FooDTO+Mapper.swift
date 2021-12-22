//
//  FooDTO+Mapper.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation

extension FooDTO {
    
    func toDomain() -> FooEntity {
        return FooEntity(param1: param1, param2: param2, param3: param3)
    }
}

extension FooEntity {
    
    func toData() -> FooDTO {
        return FooDTO(param1: param1, param2: param2, param3: param3)
    }
}
