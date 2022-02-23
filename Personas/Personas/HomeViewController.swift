

import UIKit
// Implementamos el protocolo AddPersonaDelegate
class HomeViewController: UIViewController {
    
    var personasList: [Persona] = []

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // se crea el objeto persona y se agrega la lista
        let p1 = Persona(name: "Justina Capa Sicce", id: "45388882")
        personasList.append(p1)
        
        personasList.append(Persona(name: "Jordan Capa Sixe", id: "3444213"))
        personasList.append(Persona(name: "Daniel Ortiz Arévalo", id: "4429832"))
        
        // para  interactuar con las celdas se implementa el delegate
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    @IBAction func botonAgregar(_ sender: Any) {
        print("botonAgregar")
        
        let addViewController = AddViewController()
        addViewController.delegate = self
        self.present(addViewController, animated: true, completion: nil)
        
    }
// MARK: - Navigation


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vistaDetalleRegistro = segue.destination as! DetallePersonaViewController
//        let indice = tableView.indexPathForSelectedRow!
//        vistaDetalleRegistro.persona = personas[indice.row]
//    }

}
//MARK: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personasList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPersona", for: indexPath)
        
        cell.textLabel?.text = personasList[indexPath.row].name
        cell.detailTextLabel?.text = personasList[indexPath.row].id
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            personasList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

//MARK: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    // metodo para interactuar
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("haz seleccionado la celda de \(personasList[indexPath.row].name)")
        
        let persona = personasList[indexPath.row]
        let perfilViewController =  PerfilViewController()
        perfilViewController.persona = persona
        self.navigationController?.pushViewController(perfilViewController, animated: true)
        
        
//        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
//        let detalleViewController = storyboard.instantiateViewController(withIdentifier: "detalleViewController") as! DetallePersonaViewController
//        detalleViewController.persona = personas[indexPath.row]
//        self.navigationController?.pushViewController(detalleViewController, animated: true)
//
    }
}

//MARK: implementacion de protocolo
extension HomeViewController: AddPersonaDelegate {
    func guardarNuevaPersona(persona: Persona) {
        personasList.append(persona)
        self.tableView.reloadData()
    }
}
