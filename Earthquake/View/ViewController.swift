//
//  ViewController.swift
//  Earthquake
//
//  Created by Eray Erman on 29.06.2021.
import Alamofire
import UIKit
import SideMenu

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    let viewModel = ViewModel()
    var data: [EQDataModel] = []
    var filteredData: [EQDataModel] = []
    var menu: SideMenuNavigationController?
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        setupVM()
        setupMenu()
        hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func dataSourceChanged(_ sender: Any) {
        
        viewModel.setServiceType(type: segmentControl.selectedSegmentIndex)
        
    }
    
    private func setupUI() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        self.tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier )
        self.title = "Son Depremler"
        navigationController?.navigationBar.barStyle = .black
    }
    
    private func setupVM() {
        viewModel.getData()
        viewModel.updateUI = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
            
        }
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.data = viewModel.data
        filteredData = data.filter {$0.place!.lowercased().contains(searchText.lowercased())}
        tableView.reloadData()
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        tableView.reloadData()
    }
    

     
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty {
           return filteredData.count
        }else {return viewModel.data.count}
            
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        if filteredData.isEmpty {
            let data = viewModel.data[indexPath.row]
            cell.setupUI(model: data)
        }else{
            let fData = filteredData[indexPath.row]
            cell.setupUI(model: fData)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var sendedData = viewModel.data[indexPath.row]
        if !filteredData.isEmpty {
            sendedData = filteredData[indexPath.row]
        }
        tableView.deselectRow(at: indexPath, animated: false)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "MapInfoVC") as! MapInfoVC
        let vm = MapInfoVM.init(sendedData)
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)
       
    }
    
    func setupMenu (){
        
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        menu?.statusBarEndAlpha = 0
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
    }
    @IBAction func didClickedMenuButton(_ sender: Any) {
        present(menu!, animated: true, completion: nil)
        
    }
    
    
}


// Menu Controller Class
class MenuListController : UITableViewController {
    
    @IBOutlet 
    var items = ["Hakkında", "Kandilli Rasathanesi", "AFAD"]
    
    let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha:1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = darkColor
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch indexPath.row {
        case 0:
            let vc = storyboard.instantiateViewController(identifier: "AboutVC") as! AboutVC
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            guard let url = URL(string: "http://www.koeri.boun.edu.tr/new/") else { return }
            UIApplication.shared.open(url)
        case 2:
            guard let url = URL(string: "https://deprem.afad.gov.tr") else { return }
            UIApplication.shared.open(url)
        default:
            break
        }
        
        /*if indexPath.row == 0 {
            let vc = storyboard.instantiateViewController(identifier: "AboutVC") as! AboutVC
            navigationController?.pushViewController(vc, animated: true)
        }*/
        
    }
    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

