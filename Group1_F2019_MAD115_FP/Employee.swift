class Employee:IPrintable
    {
    var empID : Int
    var name: String
    //var earning: Float
//    {
//        get {
//            return self.earning
//        }
//    }
    var empType : String
    
    
//    var vobj : Pojo.Vehicle
//
//    init(EmpID : Int,EmpName:String,EmpAge:Int,EmpType: String,Vobj: Pojo.Vehicle)
//    {
//        empID=EmpID
//        name = EmpName
//        age = EmpAge
//        empType=EmpType
//        vobj=Vobj
//
//    }
    
    func printMyData() {
        
        print("---------------------------------------------------------")
        print(" Emp ID :\(empID)")
        print("Name :\(name)\n")
//        if vobj.type==""{
//            print("Employee has No vehicle")
//        }
//        else{
//            print("Employee has a  : \(vobj.type)")
//            print("  -   Make : \(vobj.make)")
//            print("  -   Year : \(vobj.year)")
//            print("  -   Plate : \(vobj.plate)")
//            print("Employee is a  : \(empType)")
//
//        }
    }
    
    // created By Anikta and Karan
   
    
    func calEarnings()->Float
    {
        return 1000
    }
    
    
}
