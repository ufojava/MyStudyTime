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
    @IBOutlet weak var chartOutletButton: UIButton! //Monthly Chart Button
    @IBOutlet weak var wklyChartOutletButton: UIButton! //Weekly Chart Button
    

    
    var subPickerArray = ["English", "Literature","History","Biology","Chemistry","Maths","Physics","Geography"]
    
    //Targets Subject Data
    var calcWeekly = Int32(7)
    var calcMthly = Int32(28)
    
    //English
    var subjectEnglish = Int32()
    var subjectEnglishWklyTargets = Int32()
    var subjectEnglishMthlyTargets = Int32()
    
    //Literature
    var subjectLiterature = Int32()
    var subjectLiteratureWklyTargets = Int32()
    var subjectLiteratureMthlyTargets = Int32()
    
    //History
    var subjectHistory = Int32()
    var subjectHistoryWklyTargets = Int32()
    var subjectHistoryMthlyTargets = Int32()
    
    //Biology
    var subjectBiology = Int32()
    var subjectBiologyWklyTargets = Int32()
    var subjectBiologyMthlyTargets = Int32()
    
    //Chemistry
    var subjectChemistry = Int32()
    var subjectChemistryWklyTargets = Int32()
    var subjectChemistryMthlyTargets = Int32()
    
    //Geography
    var subjectGeography = Int32()
    var subjectGeographyWklyTargets = Int32()
    var subjectGeographyMthlyTargets = Int32()
    
    //Maths
    var subjectMaths = Int32()
    var subjectMathsWklyTargets = Int32()
    var subjectMathsMthlyTargets = Int32()
    
    //Physics
    var subjectPhysics = Int32()
    var subjectPhysicsWklyTargets = Int32()
    var subjectPhysicsMthlyTargets = Int32()
    
    //Study Data Array
    var studySubArray: [String] = [] // ********* MAY NOT BE REQUIRED *************
    var studyTotalTime: [Int32] = []
    
    //Sum of all the Study times in Array
    var addTotalArray = Int32()


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
        
        //Format button - Monthly
        chartOutletButton.setTitleColor(.white, for: .normal)
        chartOutletButton.setTitle("Monthly Chart", for: .normal)
        chartOutletButton.backgroundColor = UIColor.brown
        chartOutletButton.layer.borderColor = UIColor.gray.cgColor
        chartOutletButton.layer.borderWidth = 1
        
        //Format Button - Weekly
        wklyChartOutletButton.setTitleColor(.white, for: .normal)
        wklyChartOutletButton.setTitle("Weekly Chart", for: .normal)
        wklyChartOutletButton.backgroundColor = UIColor.brown
        wklyChartOutletButton.layer.borderColor = UIColor.gray.cgColor
        wklyChartOutletButton.layer.borderWidth = 1
        
        barChartOutletBarChartView.layer.borderColor = UIColor.gray.cgColor
        barChartOutletBarChartView.layer.borderWidth = 1
    
        
    }
    
    //Button Action
    @IBAction func chartActionButton(_ sender: UIButton) {
        //getTargetsData()
        getStudyData(inSubject: pickerOutletLabel.text!, inPeriod: 28)
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
    
    //Get Study Data with Predicate for Subject & Study Date
    func getStudyData(inSubject: String, inPeriod: Int) {
        
        //Format Calender
        var cal = Calendar.current
            cal.timeZone = NSTimeZone.local
        
        //Format Date
        let dFormatter = DateFormatter()
            dFormatter.dateStyle = .medium
            dFormatter.timeStyle = .none
        
        
        //Set Context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Convert Date String Fromat
        let convStdyDate = dFormatter.date(from: studyDateFromOutletText.text!)
        
        //Computer Weekly and Monthly Date
        var periodChoice = 0
        
        if inPeriod == 7 {
            periodChoice = 7
        } else if inPeriod == 28 {
            periodChoice = 28
        }
        
        //To check for nil value in from the conversion
        guard convStdyDate != nil else {
            print("Nil value found in convStdyDate!!!")
            return
        }
        
        //Week from input date
        let studyDateTo = cal.date(byAdding: .day, value: periodChoice, to: convStdyDate!)
        print(studyDateTo!) //This is a test for the date format
        
        //Date Precidate
        let studyDateFromPredicate = NSPredicate(format: "studyDate >= %@", convStdyDate! as NSDate)
        let studyDateToPredicate = NSPredicate(format: "studyDate < %@", studyDateTo! as NSDate)
        
        //Subject Predictae
        let subjectPredicate = NSPredicate(format: "subjectSelection == %@", inSubject)
        
        //Set Study Entity
        let studyEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Study")
        
        //Compound Predicate
        let studyCompundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [studyDateFromPredicate,studyDateToPredicate,subjectPredicate])
        
        studyEntity.predicate = studyCompundPredicate
        
        
        do {
            
            let results = try context.fetch(studyEntity)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    //Get Subject
                    guard let resSubject = result.value(forKey: "subjectSelection") as? String else {
                        print("Unable to get subject")
                        return
                    }
                    
                    studySubArray.append(resSubject)
                    
                    //Get Total Study Time
                    guard let resTotalStudyTime = result.value(forKey: "studyTimeTotal") as? Int32 else {
                        print("Unable to get total study time")
                        return
                    }
                    
                    studyTotalTime.append(resTotalStudyTime)
                    
                }
                
                //Test output
                addTotalArray = studyTotalTime.reduce(0, +)
                print(addTotalArray)
                
            }
            
            
            
        } catch {
            print("Unable to retreive results")
        }
        
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
                    //Weekly & Monthly Target Calculations
                    subjectEnglishWklyTargets = subjectEnglish * calcWeekly
                    subjectEnglishMthlyTargets = subjectEnglish * calcMthly
                    
                    //Get Literature
                    guard let resLiterature = result.value(forKey: "subLiterature") as? Int32 else {
                        print("Unable to get Target Literature")
                        return
                    }
                    
                    //Assign the result value to varialbe subjectLiterature
                    subjectLiterature = resLiterature
                    subjectLiteratureWklyTargets = subjectLiterature * calcWeekly
                    subjectLiteratureMthlyTargets = subjectLiterature * calcMthly
                    
                    //Get History
                    guard let resHistory = result.value(forKey: "subHistory") as? Int32 else {
                        print("Unable to get Target History")
                        return
                    }
                    
                    //Assign the result to variable subjectHistory
                    subjectHistory = resHistory
                    subjectHistoryWklyTargets = subjectHistory * calcWeekly
                    subjectHistoryMthlyTargets = subjectHistory * calcMthly
                    
                    //Get Biology
                    guard let resBiology = result.value(forKey: "subBiology") as? Int32 else {
                        print("Unable to get Target Biology")
                        return
                    }
                    
                    //Assign Biology to variable
                    subjectBiology = resBiology
                    subjectBiologyWklyTargets = subjectBiology * calcWeekly
                    subjectBiologyMthlyTargets = subjectBiology * calcMthly
                    
                    //Get Chemistry
                    guard let resChemistry = result.value(forKey: "subChemistry") as? Int32 else {
                        print("Unable to get Target Chmistry")
                        return
                    }
                    
                    //Assign result to variable Chmistry
                    subjectChemistry = resChemistry
                    subjectChemistryWklyTargets = subjectChemistry * calcWeekly
                    subjectChemistryMthlyTargets = subjectChemistry * calcMthly
                    
                    //Get Maths
                    guard let resMaths = result.value(forKey: "subMaths") as? Int32 else {
                        print("Unable to get Target Maths")
                        return
                    }
                    
                    //Assign result to Maths variable
                    subjectMaths = resMaths
                    subjectMathsWklyTargets = subjectMaths * calcWeekly
                    subjectMathsMthlyTargets = subjectMaths * calcMthly
                    
                    //Get Physics
                    guard let resPhysics = result.value(forKey: "subPhysics") as? Int32 else {
                        print("Unable to get Targets Physics")
                        return
                    }
                    subjectPhysics = resPhysics
                    subjectPhysicsWklyTargets = subjectPhysics * calcWeekly
                    subjectPhysicsMthlyTargets = subjectPhysics * calcMthly
                    
                    
                    //Get Geography
                    guard let resGeography = result.value(forKey: "subGeography") as? Int32 else {
                        print("Unable to get Targets Geography")
                        return
                    }
                    
                    //Assign result to variable Geopgraphy
                    subjectGeography = resGeography
                    subjectGeographyWklyTargets = subjectGeography * calcWeekly
                    subjectGeographyMthlyTargets = subjectGeography * calcMthly
                    
                }
                
            
                print(subjectEnglishWklyTargets)
                print(subjectEnglishMthlyTargets)
                print(subjectPhysicsWklyTargets)
                print(subjectPhysicsMthlyTargets)
                print(subjectChemistryWklyTargets)
                print(subjectChemistryMthlyTargets)
                print(subjectBiologyWklyTargets)
                print(subjectBiologyMthlyTargets)
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
