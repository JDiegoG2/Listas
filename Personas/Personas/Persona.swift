//
//  Persona.swift
//  Personas
//
//  Created by Developer on 15/02/22.
//

import Foundation

class Persona {
    let name: String
    let id: String
    let edad: String
    let telefono: String
    let direccion: String
    
    init(name: String, id:String, edad: String, telefono: String, direccion: String) {
        self.name = name
        self.id = id
        self.edad = edad
        self.telefono = telefono
        self.direccion = direccion
    }
    
}
