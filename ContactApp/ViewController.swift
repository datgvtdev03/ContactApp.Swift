//
//  ViewController.swift
//  ContactApp
//
//  Created by VanHuy on 2023-05-11.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblContact: UITableView!
    
    @IBOutlet weak var txtSearch: UITextField!
    
    var danhBa: [LienHe] = []
    var danhBaCanTim: [LienHe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        danhBaCanTim = danhBa;
        
    }
    
    // Khởi tạo dữ liệu cho table view
    func initData() {
        let lienHe1 = LienHe(id: 1, name: "Giáp Phượng", phoneNumber: "123")
        danhBa.append(lienHe1)
        
        let lienHe2 = LienHe(id: 2, name: "Vũ Đình Duẩn", phoneNumber: "234")
        danhBa.append(lienHe2)
        
        let lienHe3 = LienHe(id: 3, name: "Nguyễn Khả Chương", phoneNumber: "456")
        danhBa.append(lienHe3)
        
        let lienHe4 = LienHe(id: 4, name: "Nguyễn Khắc Hùng", phoneNumber: "249")
        danhBa.append(lienHe4)
        
        let lienHe5 = LienHe(id: 5, name: "Nguyễn Mạnh Linh", phoneNumber: "112")
        danhBa.append(lienHe5)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return danhBaCanTim.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblContact.dequeueReusableCell(withIdentifier: "ContactCellIdentifier")!
        let currentContact = danhBaCanTim[indexPath.row]
        
        
        let lblContactName = cell.viewWithTag(101) as! UILabel
        lblContactName.text = currentContact.name
        
        let lblContactPhone = cell.viewWithTag(102) as! UILabel
        lblContactPhone.text = currentContact.phoneNumber
        
        return cell
    }
    
    
    @IBAction func btnDeleteContacts(_ sender: UIButton) {
        for (index, contact) in danhBaCanTim.enumerated().reversed() {
            if contact.id % 2 == 0 {
                danhBaCanTim.remove(at: index)
                
            }
        }
        tblContact.reloadData()
    }
    
    //    Bắt sự kiện vuốt cell là xóa
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        danhBaCanTim.remove(at: indexPath.row)
        tblContact.reloadData()
    }
    
    
    
    @IBAction func btnSearch(_ sender: UIButton) {
        search()
        
    }
    func search() {
        let lienHeCanTim: String = txtSearch.text!
        danhBaCanTim = []
        
        if lienHeCanTim == "" {
            danhBaCanTim = danhBa
        }
        
        for check in danhBa {
            if check.name.lowercased().contains(lienHeCanTim.lowercased()) {
                print (check.name)
                danhBaCanTim.append(check)
                
            }
        }
        tblContact.reloadData()
    }
    
}


struct LienHe {
    var id: Int
    var name: String
    var phoneNumber: String
    
}
