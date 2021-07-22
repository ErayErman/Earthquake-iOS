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
    
    let viewModel = ViewModel()
    var data: [EQDataModel] = []
    var filteredData: [EQDataModel] = []
    var filter = false
    
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
        self.searchBar.delegate = self
        self.tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier )
        
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
        filteredData = data.filter {$0.place!.lowercased().prefix(searchText.count) == searchText.lowercased()}
        filter = true
        tableView.reloadData()
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        filter = false
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
    
}

