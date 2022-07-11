//
//  ViewController.swift
//  try
//
//  Created by Kesh Gurung on 10/07/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var table: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemRed
        table.dataSource = self
        table.delegate = self
        table.register(ProgTableViewCell.self, forCellReuseIdentifier: ProgTableViewCell.reuseID)
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        
        // Do any additional setup after loading the view.
    }


    private func setUpUI(){
        self.view.backgroundColor = .white
        self.title = " Minion Table View"
        self.view.addSubview(self.table)
        self.table.bindToSuperView()
        
    }
    
    
}
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProgTableViewCell.reuseID, for: indexPath) as? ProgTableViewCell else {
            return UITableViewCell()
        }
        
        cell.newIndexLabel.text = String(indexPath.row)
        
        cell.newButton.setTitle("View Details", for: .normal)
        
        cell.newImageView.image = UIImage(named: "m1")
        
        return cell
    }
    

}
extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController(text: "Index at: \(String(indexPath.row))" , imgStr: "m1" )
        self.navigationController?.pushViewController(detailVC, animated: true)

    }

}


