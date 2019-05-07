//
//  ViewController.swift
//  giants_app
//
//  Created by 山崎浩毅 on 2019/05/05.
//  Copyright © 2019年 山崎浩毅. All rights reserved.
//

import UIKit

final class ViewController: UITableViewController {
    
    private let viewModel = ListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.players.bindTo(tableView.rx.players(cellIdentifier: "Cell", cellType: ItemListViewCell.self)) { index, player, cell in
            cell.player = player
        }
        .addDisposableTo(disposeBag)
    }


}

