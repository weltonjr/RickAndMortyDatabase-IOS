import UIKit

class TableViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Service2.instance.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = Service2.instance.data[indexPath.row]
        
        cell.textLabel?.text = item.nome
        cell.detailTextLabel?.text = "\(item.tipo) - \(item.dimensão)"
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Service2.instance.nextPage()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.apiUpdate),
            name: NSNotification.Name(rawValue: "service2"),
            object: nil)
        
    }

    @objc func apiUpdate(notification: NSNotification){
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == Service2.instance.data.count - 1{
            Service2.instance.nextPage()
        }
    }
    
}

