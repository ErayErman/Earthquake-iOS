//
//  ViewController.swift
//  Earthquake
//
//  Created by Eray Erman on 29.06.2021.
import Alamofire
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ViewModel()
    
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
        performSegue(withIdentifier: "toMap", sender: nil)
    }

}

