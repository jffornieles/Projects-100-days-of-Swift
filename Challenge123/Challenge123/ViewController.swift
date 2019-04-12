//
//  ViewController.swift
//  Challenge123
//
//  Created by Jose Francisco Fornieles on 12/04/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - Properties
    var flags = [Flag]()
    let cellFlagIdentifier = "CellFlag"

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Flags of the World"
        
        loadFlags()
        
    }
    
    // MARK: - TaleView Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.assetFlag = flags[indexPath.row].assetName
            vc.nameFlag = flags[indexPath.row].displayName
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellFlagIdentifier, for: indexPath)
        
        cell.imageView?.layer.borderWidth = 1
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        cell.textLabel?.text = flags[indexPath.row].displayName
        cell.imageView?.image = UIImage(named: flags[indexPath.row].assetName)
        
        return cell
    }
    
    // MARK: - Methods
    private func loadFlags() {
        
        if let data = loadJSON() {
            let decoder = JSONDecoder()
            do {
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                flags = try decoder.decode([Flag].self, from: data)
            } catch {
                fatalError("Error load Flags: \(error.localizedDescription)")
            }
        }
    }
    
    private func loadJSON() -> Data? {
        
        if let path = Bundle.main.path(forResource: "FlagData", ofType: "json") {
            
            let urlJSON = URL(fileURLWithPath: path)
            do {
                return try Data(contentsOf: urlJSON)
            } catch {
                fatalError("Error Data JSON: \(error.localizedDescription)")
            }
        }
        
        return nil
        
    }


}

