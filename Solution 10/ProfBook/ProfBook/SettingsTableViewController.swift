//
//  SettingsTableViewController.swift
//  Contacts
//
//  Created by Michael Schlicker on 06/04/2017.
//  Copyright © 2017 TUM. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

	@IBOutlet var filterSwitch: UISwitch!
	internal let filterIdentifier = "filterActivated"
    internal let defaults = UserDefaults.standard
	
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
        filterSwitch.setOn(defaults.bool(forKey: filterIdentifier), animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    @IBAction func switchFilter(_ sender: Any) {
        defaults.set(filterSwitch.isOn, forKey: filterIdentifier)
	}

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
