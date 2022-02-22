//
//  AddViewController.swift
//  Personas
//
//  Created by Developer on 16/02/22.
//

import UIKit



class AddViewController: UIViewController {

    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textDni: UITextField!
    
    var delegate: AddPersonaDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func guardarPersona(_ sender: Any) {
        
        if !(textName.text?.isEmpty)! && !(textDni.text?.isEmpty)!{
            let namePerson = (textName.text!)
            let dniPerson = (textDni.text!)
            let person = Persona(name: namePerson, id: dniPerson)
            delegate?.guardarNuevaPersona(persona: person)
            self.dismiss(animated: true, completion: nil)
        }
    }
}
