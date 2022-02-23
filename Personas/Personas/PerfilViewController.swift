
import UIKit


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
}
