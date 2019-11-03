//
//  ChartsReport_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 31/10/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData
import Charts

//Charts from all Entities in CoreData
class ChartsReport_VC: UIViewController {
    
    //ChartViewController Outlet
    @IBOutlet weak var navbarOutletNavBar: UINavigationBar!
    @IBOutlet weak var navbarItemOutletNavbarItem: UIBarButtonItem!
    @IBOutlet weak var pickerOutletLabel: UILabel!
    @IBOutlet weak var studyDateFromOutletText: UITextField!
    @IBOutlet weak var pickerViewOutletPickerview: UIPickerView!
    @IBOutlet weak var barChartOutletBarChartView: BarChartView!
    @IBOutlet weak var chartOutletButton: UIButton!
    

    
    var subPickerArray = ["English", "Literature","History","Biology","Chemistry","Maths","Physics","Geography"]
    
    //Targets Subject Data
    var subjectEnglish = Int32()
    var subjectLiterature = Int32()
    var subjectHistory = Int32()
    var subjectBiology = Int32()
    var subjectChemistry = Int32()
    var subjectGeography = Int32()
    var subjectMaths = Int32()
    var subjectPhysics = Int32()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Custom Function starts here
        formatVC() //Format ViewController
        connectDatasorceDelegate() //Connection for Pickerview
    }
    
    //Format ViewController
    func formatVC() {
        
        //Set Navbar and Item
        navbarOutletNavBar.topItem?.title = "STUDY REPORT CHART"
        navbarOutletNavBar.layer.shadowOpacity = 1
        navbarOutletNavBar.layer.shadowRadius = 5
        navbarOutletNavBar.layer.shadowColor = UIColor.white.cgColor
        navbarOutletNavBar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        navbarItemOutletNavbarItem.title = "Back"
        
        //Set image Frame
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        //Image
        backgroundImage.image = UIImage(named: "Other_VCBackground.jpg")
        
        //Set Image fill
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Format lable and text field
        pickerOutletLabel.textColor = UIColor.purple
        pickerOutletLabel.textAlignment = .center
        pickerOutletLabel.font = pickerOutletLabel.font.withSize(14)
        pickerOutletLabel.layer.borderColor = UIColor.gray.cgColor
        pickerOutletLabel.layer.borderWidth = 1
        
        studyDateFromOutletText.font = studyDateFromOutletText.font?.withSize(14)
        studyDateFromOutletText.clearButtonMode = .always
        studyDateFromOutletText.layer.borderColor = UIColor.gray.cgColor
        studyDateFromOutletText.layer.borderWidth = 1
        
        //PickerView
        pickerViewOutletPickerview.layer.borderColor = UIColor.gray.cgColor
        pickerViewOutletPickerview.layer.borderWidth = 1
        
        //Format button
        chartOutletButton.setTitleColor(.white, for: .normal)
        chartOutletButton.backgroundColor = UIColor.brown
        chartOutletButton.layer.borderColor = UIColor.gray.cgColor
        chartOutletButton.layer.borderWidth = 1
        
        barChartOutletBarChartView.layer.borderColor = UIColor.gray.cgColor
        barChartOutletBarChartView.layer.borderWidth = 1
    
        
    }
    
    //Button Action
    @IBAction func chartActionButton(_ sender: UIButton) {
        getTargetsData()
    }
    
    
    
    
    //Call Date From
    @IBAction func callDatePicker(_ sender: UITextField) {
        getDatePicker()
    }
    
    
    
    
    
    
    //Call Report Menu
    @IBAction func backToRptMenu(_ sender: UIBarButtonItem) {
        
        //MainStoryboard
        let mainstoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Report Menu
        let rptMenu = mainstoryBoard.instantiateViewController(identifier: "reportMenu_VC") as! ReportnMenu_VC
            rptMenu.modalPresentationStyle = .fullScreen
        //Call Menu
        self.present(rptMenu,animated: true,completion: nil)
    }
    
    //Function for DataSource, Delegate conneciton
    func connectDatasorceDelegate() {
        
        //Connection for Pickerview
        pickerViewOutletPickerview.dataSource = self
        pickerViewOutletPickerview.delegate = self
        
    }
    
    
    //Get Study target - and calcualte Weekly and Month amounts
    func getTargetsData() {
        
        //Set context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set Targets Entity & Predicate
        let targetsEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Study_Targets")
            targetsEntity.predicate = NSPredicate(format: "subTargets == %@", "targetCode")
        
        //Set fault report
        targetsEntity.returnsObjectsAsFaults = false
        
        //Fetch data from Study_Targets:  "English", "Literature","History","Biology","Chemistry","Maths","Physics","Geography"
        
        do {
            let results = try context.fetch(targetsEntity)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                
                    
                    //Get English
                    guard let resEnglish = result.value(forKey: "subEnglish") as? Int32 else {
                        print("Unable to get Target English")
                        return
                    }
                    
                    //Assign the result value to Variable subjectEnglish
                    subjectEnglish = resEnglish
                    
                    //Get Literature
                    guard let resLiterature = result.value(forKey: "subLiterature") as? Int32 else {
                        print("Unable to get Target Literature")
                        return
                    }
                    
                    //Assign the result value to varialbe subjectLiterature
                    subjectLiterature = resLiterature
                    
                    //Get History
                    guard let resHistory = result.value(forKey: "subHistory") as? Int32 else {
                        print("Unable to get Target History")
                        return
                    }
                    
                    //Assign the result to variable subjectHistory
                    subjectHistory = resHistory
                    
                    //Get Biology
                    guard let resBiology = result.value(forKey: "subBiology") as? Int32 else {
                        print("Unable to get Target Biology")
                        return
                    }
                    
                    //Assign Biology to variable
                    subjectBiology = resBiology
                    
                    //Get Chemistry
                    guard let resChemistry = result.value(forKey: "subChemistry") as? Int32 else {
                        print("Unable to get Target Chmistry")
                        return
                    }
                    
                    //Assign result to variable Chmistry
                    subjectChemistry = resChemistry
                    
                    //Get Maths
                    guard let resMaths = result.value(forKey: "subMaths") as? Int32 else {
                        print("Unable to get Target Maths")
                        return
                    }
                    
                    //Assign result to Maths variable
                    subjectMaths = resMaths
                    
                    //Get Physics
                    guard let resPhysics = result.value(forKey: "subPhysics") as? Int32 else {
                        print("Unable to get Targets Physics")
                        return
                    }
                    subjectPhysics = resPhysics
                    
                    
                    //Get Geography
                    guard let resGeography = result.value(forKey: "subGeography") as? Int32 else {
                        print("Unable to get Targets Geography")
                        return
                    }
                    
                    //Assign result to variable Geopgraphy
                    subjectGeography = resGeography
                    
                }
                
                print(subjectEnglish)
                print(subjectPhysics)
                print(subjectChemistry)
                print(subjectBiology)
            }
            
        } catch {
            print("Unable to fetch Targets Data")
        }
        

        
        
    }
    
    
    
    //Setup DatePicker
    let dPicker = UIDatePicker()
  
    
    
    //Function to trigger DatePicker for Text field
    func getDatePicker() {
        
        //Date Picker Mode
        dPicker.datePickerMode = .date
        
        //Format Date
        let dFormatter = DateFormatter()
            dFormatter.dateStyle = .medium
            dFormatter.timeStyle = .none
        
        //Configure Toolbar
        let chartToolBar = UIToolbar()
            chartToolBar.sizeToFit()
        
        
        //Set up Done, Space and Cancel options in the tool bar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        
        //Space Creation
        let spaceAdjust = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        //Cancel Button
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        
        //Call Tool bar option
        chartToolBar.setItems([doneButton,spaceAdjust,cancelButton], animated: false)
        studyDateFromOutletText.inputAccessoryView = chartToolBar
        studyDateFromOutletText.inputView = dPicker
        
    }
    
    
    //Function for Done
   @objc func doneDatePicker() {
      
        //Format Date
        let dFormatter = DateFormatter()
            dFormatter.dateStyle = .medium
            dFormatter.timeStyle = .none
        
        if (studyDateFromOutletText.isEditing) {
            studyDateFromOutletText.text = dFormatter.string(from: dPicker.date)
            self.view.endEditing(true)
        }
        
    }
    
    //Function to Cancel DatePicker
   @objc func cancelDatePicker() {
    self.view.endEditing(true)
        
    }
    


}

//Extension for Subject PickerView
extension ChartsReport_VC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        //Return Array Subject List
        return subPickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return subPickerArray[row]
    }
    
    //Selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        pickerOutletLabel.text = subPickerArray[row]
    }
    
}
