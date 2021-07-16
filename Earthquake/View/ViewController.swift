//
//  ViewController.swift
//  Earthquake
//
//  Created by Eray Erman on 29.06.2021.
import Alamofire
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let searchController = UISearchController(searchResultsController: nil)
    let viewModel = ViewModel()
    
    var data: [EQDataModel] = []
    var filteredData: [EQDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        setupVM()
        self.title = "Son Depremler"
        
        
               
    }
    
    private func setupUI() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier )
        filteredData = viewModel.data
        
        
    }
    
    private func setupVM() {
        viewModel.getData()
        viewModel.updateUI = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
            
        }
        
    }

     
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.data.count } //viewModel.data.count
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.setupUI(model: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sendedData = viewModel.data[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: false)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "MapInfoVC") as! MapInfoVC
        let vm = MapInfoVM.init(sendedData)
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
}

