

import UIKit
import PopupDialog




class AddViewController: UIViewController {


    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textDni: UITextField!
    @IBOutlet weak var textEdad: UITextField!
    @IBOutlet weak var textTelefono: UITextField!
    @IBOutlet weak var textDireccion: UITextField!


    var delegate: AddPersonaDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        textName.delegate = self
        textDni.delegate = self
        textEdad.delegate = self
        textTelefono.delegate = self


    }
    
    @IBAction func guardarPersona(_ sender: Any) {
        
        if !(textName.text?.isEmpty)!, !(textDni.text?.isEmpty)!, !(textEdad.text?.isEmpty)!, !(textTelefono.text?.isEmpty)!, !(textDireccion.text?.isEmpty)!{
            let namePerson = (textName.text!)
            let dniPerson = (textDni.text!)
            let edadPerson = (textEdad.text!)
            let telPerson = (textTelefono.text!)
            let dirPerson = (textDireccion.text!)
            let person = Persona(name: namePerson, id: dniPerson, edad: edadPerson, telefono: telPerson,direccion: dirPerson)
            delegate?.guardarNuevaPersona(persona: person)
            self.dismiss(animated: true, completion: nil)
        } else {
            // Prepare the popup assets
            let title = "ERROR"
            let message = "Ingrese los datos solicitados"
            let image = UIImage(named: "pexels-photo-103290")

            // Create the dialog
            let popup = PopupDialog(title: title, message: message, image: image)

            // Create buttons
            let buttonOne = CancelButton(title: "Cerrar") {
                print("You canceled the car dialog.")
            }

            popup.addButtons([buttonOne])

            // Present dialog
            self.present(popup, animated: true, completion: nil)

        }
    }
}

extension AddViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textDni {
            if range.location > 7 {
                return false
            }
        }
        if textField == textEdad {
            if range.location > 1 {
                return false
            }
        }
        if textField == textTelefono {
            if range.location > 8 {
                return false
            }
        }
        return true
    }
}



