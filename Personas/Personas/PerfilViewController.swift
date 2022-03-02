
import UIKit


class PerfilViewController: UIViewController {
    
    @IBOutlet weak var nombrePersonaLabel: UITextField!
    @IBOutlet weak var idPersonaLabel: UITextField!
    @IBOutlet weak var edadPersonaLabel: UITextField!
    @IBOutlet weak var numeroTelefonico: UITextField!
    @IBOutlet weak var dirDomicilio: UITextField!


    var persona: Persona?
    var delegate: AddPersonaDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if persona != nil {
            nombrePersonaLabel.text = persona!.name
            idPersonaLabel.text = persona!.id
            edadPersonaLabel.text = persona!.edad
            numeroTelefonico.text = persona!.telefono
            dirDomicilio.text = persona!.direccion

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

    @IBAction func actualizarPersona(_ sender: Any) {
        delegate?.guardarNuevaPersona(persona: persona!)
        self.dismiss(animated: true, completion: nil)
    }
}
