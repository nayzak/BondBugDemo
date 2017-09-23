//
//  ViewController.swift
//  BondFix
//
//  Created by Ian Kazlauskas on 28/07/2017.
//  Copyright © 2017 Ian Kazlauskas. All rights reserved.
//

import Cocoa
import ReactiveKit
import Bond

class ViewController: NSViewController {

  struct ViewModel {

    let title: String

  }
  
  @IBOutlet weak var tableView: NSTableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let viewModels: SafeSignal<[ViewModel]> = .just([
      ViewModel(title: "One"),
      ViewModel(title: "Two"),
      ViewModel(title: "Three")
    ])

    viewModels.bind(to: tableView, animated: true) { titles, row, tableView in
        let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CellID"), owner: nil) as! NSTableCellView
      cell.textField?.stringValue = titles[row].title
      return cell
    }
  }

}

