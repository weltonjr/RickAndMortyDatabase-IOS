import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Service.instance.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = Service.instance.data[indexPath.row]
        
        cell.textLabel?.text = item.nome
        cell.detailTextLabel?.text = "\(item.sexo) \(item.especie)"
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Service.instance.nextPage()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.apiUpdate),
            name: NSNotification.Name(rawValue: "service"),
            object: nil)
        
    }

    @objc func apiUpdate(notification: NSNotification){
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == Service.instance.data.count - 1{
            Service.instance.nextPage()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            if let pos = tableView.indexPathForSelectedRow?.row{
                viewController.item = Service.instance.data[pos]
            }
        }
    }
}

