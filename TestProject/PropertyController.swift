//
//  PropertyController.swift
//  TestProject
//
//  Created by Ljubisa Katana on 2/18/19.
//  Copyright © 2019 Ljubisa Katana. All rights reserved.
//

import UIKit

class PropertyController: UITableViewController {
    
    // TODO: - Configure TV for all orientation
    //..
    
    // TODO: - Local DATA -> Custom Structure
    var properties = [Property]()
    
    // Temporary
    private var property = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "img-search"), for: .normal)
        button.addTarget(self, action: #selector(searchHandler), for: .touchUpInside)
        return button
    }()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNaviagtion()
        configureTableView()
        getData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PropertyCell
        cell.result = properties[indexPath.row]
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

private extension PropertyController {
    func configureNaviagtion() {
        self.navigationItem.searchBarButtonItem(button: searchButton)
        navigationItem.title = "Properties"
        navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(signOutHandler))
    }
    
    @objc func signOutHandler() {
        let vc = SetupController()
        show(vc, sender: nil)
        
        print(#function)
    }
    
    @objc func searchHandler() {
        // MARK: - Go on Search forma
        let vc = SearchController()
        show(vc, sender: nil)
        
        print(#function)
    }
    
    func configureTableView() {
        tableView.register(PropertyCell.self, forCellReuseIdentifier: "cell")
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
        tableView.tableHeaderView?.backgroundColor = .red
        tableView.rowHeight = 120
        tableView.separatorStyle = .none
    }
}

extension PropertyController {
    func getData() {
        properties.append(Property(name: "M83 - Apartments", location: "Limassol, tourist area.", image: UIImage(named: "star-outline")!, amount: "35000$", no: "HD5-7053-PAR-PP"))
        properties.append(Property(name: "M83 - Apartments", location: "Limassol, tourist area.", image: UIImage(named: "star-outline")!, amount: "35000$", no: "HD5-7053-PAR-PP"))
        properties.append(Property(name: "M83 - Apartments", location: "Limassol, tourist area.", image: UIImage(named: "star-outline")!, amount: "35000$", no: "HD5-7053-PAR-PP"))
        properties.append(Property(name: "M83 - Apartments", location: "Limassol, tourist area.", image: UIImage(named: "star-outline")!, amount: "35000$", no: "HD5-7053-PAR-PP"))
        properties.append(Property(name: "M83 - Apartments", location: "Limassol, tourist area.", image: UIImage(named: "star-outline")!, amount: "35000$", no: "HD5-7053-PAR-PP"))
        properties.append(Property(name: "M83 - Apartments", location: "Limassol, tourist area.", image: UIImage(named: "star-outline")!, amount: "35000$", no: "HD5-7053-PAR-PP"))
        properties.append(Property(name: "M83 - Apartments", location: "Limassol, tourist area.", image: UIImage(named: "star-outline")!, amount: "35000$", no: "HD5-7053-PAR-PP"))
        properties.append(Property(name: "M83 - Apartments", location: "Limassol, tourist area.", image: UIImage(named: "star-outline")!, amount: "35000$", no: "HD5-7053-PAR-PP"))
        properties.append(Property(name: "M83 - Apartments", location: "Limassol, tourist area.", image: UIImage(named: "star-outline")!, amount: "35000$", no: "HD5-7053-PAR-PP"))
        properties.append(Property(name: "M83 - Apartments", location: "Limassol, tourist area.", image: UIImage(named: "star-outline")!, amount: "35000$", no: "HD5-7053-PAR-PP"))
        properties.append(Property(name: "M83 - Apartments", location: "Limassol, tourist area.", image: UIImage(named: "star-outline")!, amount: "35000$", no: "HD5-7053-PAR-PP"))
    }
}
