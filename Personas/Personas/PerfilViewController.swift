//
//  PerfilViewController.swift
//  Personas
//
//  Created by Developer on 16/02/22.
//

import UIKit
//

class PerfilViewController: UIViewController {
    
    @IBOutlet weak var nombrePersonaLabel: UILabel!
    @IBOutlet weak var idPersonaLabel: UILabel!
    var persona: Persona?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if persona != nil {
          nombrePersonaLabel.text = persona!.name
            idPersonaLabel.text = persona!.id
        }
        
        guard let miPersona = self.persona else {
            return
        }
        
        nombrePersonaLabel.text = miPersona.name
        idPersonaLabel.text = miPersona.id
        
        if let miPersona = self.persona {
            nombrePersonaLabel.text = miPersona.name
            idPersonaLabel.text = miPersona.id
        }
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
   

     */
}
