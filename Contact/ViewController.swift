//
//  ViewController.swift
//  Contact
//
//  Created by NGUYEN HOANG NGOC TRAN on 8/6/20.
//  Copyright © 2020 NGUYEN HOANG NGOC TRAN. All rights reserved.
//

import UIKit
import Contacts
class ViewController: UIViewController {

    var contacts =  [FetchedContact]()
    


    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchContacts()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ContactReuseCell")
    }
    private func fetchContacts() {
        print("Attempting to fetch contacts")

        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("failed to request access", error)
                return
            }

            if granted {
                print("access granted")

                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])

                do {
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                        print(contact.givenName)
                        self.contacts.append(FetchedContact(firstName: contact.givenName, lastName: contact.familyName))
                    })
                } catch let error {
                    print("Failed to enumerate contact", error)
                }
            } else {
                print("access denied")
            }
        }
    }
   
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("you tapped me")
    }
}
extension ViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell",for: indexPath)
            
        cell.textLabel?.text = contacts[indexPath.row].lastName + " " +
            contacts[indexPath.row].firstName
        cell.imageView?.image = UIImage(named: "58.png")
        return cell
    }
    
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
}

