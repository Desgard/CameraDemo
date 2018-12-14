//
//  MenuViewController.swift
//  ChihuahuaDemo
//
//  Created by Harry Duan on 2018/12/13.
//  Copyright © 2018 Harry Twan. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            switch indexPath.row {
            case 1:
                navigationController?.pushViewController(BeautyCameraViewController(), animated: true)
            default:
                break
            }
        }
        else if indexPath.section == 1 {
            
        }
        else if indexPath.section == 2 {
            
        }
    }
}
