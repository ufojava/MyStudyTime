//
//  TargetDetailsRpt_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 29/10/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

//Targets Details Reports
class TargetDetailsRpt_VC: UIViewController {
    
    //ViewController Outlet
    @IBOutlet weak var navbarOutletNavBar: UINavigationBar!
    @IBOutlet weak var itemOutletNavbarItem: UIBarButtonItem!
    @IBOutlet weak var weeklyTargetsOutletButton: UIButton!
    @IBOutlet weak var monthlyTargetsOutletButton: UIButton!
    @IBOutlet weak var tableviewOutletTableview: UITableView!
    @IBOutlet weak var infoOutletLabel: UILabel!
    
    //Variable to hold target
    var subTargetArray = ["English", "Literature","History","Biology","Chemistry","Maths","Physics","Geography"]
    
    //Period Targets
    var wklyTargets = Int32(7)
    var mthlyTargets = Int32(28)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom Functions from here
        formatVC() //Format View Controller
        conDelegateDatasource() //Connect TableView
        
        
    }
    
    //Format ViewController
    func formatVC() {
        
        //Set background
        let backgorundImage = UIImageView(frame: UIScreen.main.bounds)
            backgorundImage.image = UIImage(named: "Other_VCBackground.jpg")
        
        //Apply image
        backgorundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgorundImage, at: 0)
        
        //Format Navigation bar
        navbarOutletNavBar.topItem?.title = "TARGETS DETAILS REPORTS"
        itemOutletNavbarItem.title = "Back"
        navbarOutletNavBar.layer.shadowColor = UIColor.white.cgColor
        navbarOutletNavBar.layer.shadowOpacity = 1
        navbarOutletNavBar.layer.shadowRadius = 5
        navbarOutletNavBar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        tableviewOutletTableview.layer.borderColor = UIColor.gray.cgColor
        tableviewOutletTableview.layer.borderWidth = 1
        
        
        //Format Buttons
        weeklyTargetsOutletButton.setTitleColor(.white, for: .normal)
        weeklyTargetsOutletButton.backgroundColor = UIColor.brown
        
        monthlyTargetsOutletButton.setTitleColor(.white, for: .normal)
        monthlyTargetsOutletButton.backgroundColor = UIColor.brown
        
        //Format Info label
        infoOutletLabel.layer.borderColor = UIColor.gray.cgColor
        infoOutletLabel.layer.borderWidth = 1
        infoOutletLabel.textAlignment = .center
        
        //Hide unused cells
        tableviewOutletTableview.tableFooterView = UIView()
        
        
        
        
    }
    
    @IBAction func weeklyTargetButton(_ sender: UIButton) {
        
       
        getTargets(inPeriod: 7) //Weekly
        tableviewOutletTableview.reloadData()
        infoOutletLabel.textColor = UIColor.purple
        infoOutletLabel.text = "Total Weekly Targets"
        
    }
    
    @IBAction func monthlyTargetButton(_ sender: UIButton) {
        
       
        getTargets(inPeriod: 28) //Monthly
        tableviewOutletTableview.reloadData()
        infoOutletLabel.textColor = UIColor.blue
        infoOutletLabel.text = "Total Monthly Targets"
        
    }
    
    
    
    //Call Menu
    @IBAction func callReportMenu(_ sender: UIBarButtonItem) {
        
        //Set StoryBoard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Report Menu
        let mainReportMenu = mainStoryBoard.instantiateViewController(identifier: "reportMenu_VC") as! ReportnMenu_VC
            mainReportMenu.modalPresentationStyle = .fullScreen
        
        self.present(mainReportMenu,animated: true,completion: nil)
    }
    
    
    //Get Targets
    func getTargets(inPeriod: Int32) {
        
        //Set context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set Entity
        let targetsEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Study_Targets")
            targetsEntity.predicate = NSPredicate(format: "subTargets == %@", "targetCode")
        
            targetsEntity.returnsObjectsAsFaults = false
        
        //Get Targets Data from CoreData
        
        do {
            let results = try context.fetch(targetsEntity)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    //Subject English
                    guard let resEnglish = result.value(forKey: "subEnglish") as? Int32 else {
                        print("Unable to get English Target")
                        return
                    }
                    
                    //Period Targets
                    let englishPeriodTargets = resEnglish * inPeriod
                    
                    subTargetArray[0] = "English: \(englishPeriodTargets)"
                    print(subTargetArray[0])
                    
                    //Literature
                    guard let resLiterature = result.value(forKey: "subLiterature") as? Int32 else {
                        print("Unableto get Literature")
                        return
                    }
                    
                    //Period Targets
                    let literaturePeriodTargets = resLiterature * inPeriod
                    
                    subTargetArray[1] = "Literature: \(literaturePeriodTargets)"
                    print(subTargetArray[1])
                    
                    //History
                    guard let resHistory = result.value(forKey: "subHistory") as? Int32 else {
                        print("Unable to get History")
                        return
                    }
                    
                    //Period Targets
                    let historyPeriodTargets = resHistory * inPeriod
                    
                    subTargetArray[2] =  "History: \(historyPeriodTargets)"
                    print(subTargetArray[2])
                    
                    
                    
                    //Biology
                    guard let resBiology = result.value(forKey: "subBiology") as? Int32 else {
                        print("Unable to get Biology")
                        return
                    }
                    
                    //Period Targets
                    let biologyPeriodTargets = resBiology * inPeriod
                    
                    subTargetArray[3] = "Biology: \(biologyPeriodTargets)"
                    print(subTargetArray[3])
                    
                    //Chemistry
                    guard let resChemistry = result.value(forKey: "subChemistry") as? Int32 else {
                        print("Unable to get Chemistry")
                        return
                    }
                    
                    //Period Targets
                    let chemistryPeriodTargets = resChemistry * inPeriod
                    
                    subTargetArray[4] = "Chemistry: \(chemistryPeriodTargets)"
                    print(subTargetArray[4])
                    
                    
                    //Maths
                    guard let resMaths = result.value(forKey: "subMaths") as? Int32 else {
                        print("Unable to get Maths")
                        return
                    }
                    
                    //Period Targets
                    let mathsPeriodTargets = resMaths * inPeriod
                    
                    subTargetArray[5] = "Maths: \(mathsPeriodTargets)"
                    print(subTargetArray[5])
                    
                    
                    //Physics
                    guard let resPhysics = result.value(forKey: "subPhysics") as? Int32 else {
                        print("Unable to get Physics")
                        return
                    }
                    
                    //Period Targets
                    let physicsPeriodTargets = resPhysics * inPeriod
                    
                    subTargetArray[6] = "Physics: \(physicsPeriodTargets)"
                    print(subTargetArray[6])
                    
                    //Geography
                    guard let resGeography = result.value(forKey: "subGeography") as? Int32 else {
                        print("Unable to get Geography")
                        return
                    }
                    
                    //Period Targets
                    let geographyPeriodTargets = resGeography * inPeriod
                    
                    subTargetArray[7] = "Geography \(geographyPeriodTargets)"
                    print(subTargetArray[7])

                    
                    
                    
                    
                }
                
            
                
            
            }
                
        } catch {
            print("Unable to get records")
        }
    }
    //Connect Delegate and Datasource
    func conDelegateDatasource() {
        
        tableviewOutletTableview.delegate = self
        tableviewOutletTableview.dataSource = self
        
    }
    


}

//Set environment for tableview
extension TargetDetailsRpt_VC: UITableViewDelegate, UITableViewDataSource {
    
    //Number of components
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        subTargetArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableviewOutletTableview.dequeueReusableCell(withIdentifier: "targetDetailCell") as! TargetsDetailsRptCell_TVC
        
        cell.subTargetsOutletCell.textColor = UIColor.brown
        cell.subTargetsOutletCell.font = cell.subTargetsOutletCell.font.withSize(14)
        cell.subTargetsOutletCell.text = subTargetArray[indexPath.row]
        
        return cell
        
    }
    
    
    
}
