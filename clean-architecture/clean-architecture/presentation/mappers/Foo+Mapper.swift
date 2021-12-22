//
//  Foo+Mapper.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 22/12/2021.
//

import Foundation

extension FooUi {
    
    func toDomain() -> FooEntity {
        return (FooEntity(param1: param1, param2: 0, param3: true))
    }
}

extension FooEntity {
    
    func toPresentation() -> FooUi {
        return FooUi(param1: param1)
    }
}
