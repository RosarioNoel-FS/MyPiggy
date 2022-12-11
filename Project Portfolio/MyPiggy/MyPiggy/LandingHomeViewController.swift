//
//  LandingHomeViewController.swift
//  MyPiggy
//
//  Created by Noel Rosario on 11/27/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase

class LandingHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var goalTableView: UITableView!
    
    @IBOutlet weak var homeImage: UIImageView!
    
    var hasAGoal = false
    
    
    var goals = [Goal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if hasAGoal
        {
            goalTableView.isHidden = false
            homeImage.isHidden = true
        }
        else
        {
            goalTableView.isHidden = true
            homeImage.isHidden = false
        }
        
        

        // Do any additional setup after loading the view.
        let ref = Database.database().reference()
        
        let userID = Auth.auth().currentUser?.uid ?? ""
        
        /* refHandle = postRef.observe(DataEventType.value, with: { snapshot in
         // ...
       })*/
        
        
//        ref.child("Users").child(userID).observe(.value, { (snapShot) in
//            if let dictionary = snapShot.value as [String : Any]
//            {
//                let email = dictionary["email"] as String!
//                print(email)
//            }
//        }) {(error) in
        
        let newRef = ref.child("Users").observe(.value, with: { (snapshot) in
            if let id = snapshot.value as? [String : Any]
            {

                for child in s
                
                
                
                //                for i in id
//                {
//                    print("THIS ====\(i)")
//                }
//            }
//            else
//            {
//                print("DID NOT WORK!!!!!!!!!!!!!!")
//            }
        })

//
        
        
        //let newRef = ref.child("Users").child(userID).child("goals").getData { error, snapshot in
            //print("dump \(snapshot?.children.allObjects)")

            //COME BACK TO THIS!
            //            for child in snapshot!.children.allObjects as
//            {
//                let childsnap = snapshot?.childSnapshot(forPath: child.key)
//                if let goalName = childsnap.value["goalName"] as? String,
//                                   let goalKey = childsnap.value["key"] as? String {
//                                    let goal = Goal(goalName: goalName, goalKey: goalKey)
//                    self. goals.append(goal)
//                    self. goalTableView.reloadData()
            //}
                
            //}
        //}
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
