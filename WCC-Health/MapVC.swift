//
//  MapVC.swift
//  WCC-Health
//
//  Created by Akhil on 10/3/17.
//
//

import UIKit
import GoogleMaps
import CoreLocation
import GooglePlaces
import Alamofire


class MapVC: UIViewController,GMSMapViewDelegate,CLLocationManagerDelegate{

    let URLString = "http://parkapps.kent.edu/WCC-Health/ios/guest.php"
    
    @IBOutlet weak var googleMapView: GMSMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var locationManager: CLLocationManager!
        locationManager=CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        let camera = GMSCameraPosition.camera(withLatitude: 10.229773, longitude: -12.816033, zoom: 8.0)
        self.googleMapView.camera = camera

        let location = locationManager.location?.coordinate
        //        NSLog(String(location!.longitude))
        //        NSLog(String(location!.latitude))
        print(location!.longitude)
        print(location!.latitude)
        
        imageButton()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        apiCall()
        self.navigationController?.isNavigationBarHidden = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func imageButton()
    {
        let image = UIImage(named: "recordButton") as UIImage?
        let button   = UIButton(type: UIButtonType.custom) as UIButton
        button.frame = CGRect(x: 280, y:600, width:100, height:100)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(MapVC.btnTouched), for:.touchUpInside)
        self.view.addSubview(button)
    }
    
    func btnTouched(){
        performSegue(withIdentifier: "SendCoordinates", sender: nil)
        
        NSLog("touched")
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        let position = CLLocationCoordinate2D(latitude: 10, longitude: 10)
        let marker = GMSMarker(position: position)
        
        //marker.map = self.vwGMap
        marker.title = "Hello World"
        marker.map = mapView
        return true
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        // Custom logic here
        let marker = GMSMarker()
        marker.position = coordinate
        marker.title = "I added this with a long tap"
        marker.snippet = ""
        marker.map = mapView
    }
    
    func apiCall()
    {
        Alamofire.request(URLString).responseJSON { response in
            //as? Dictionary<String, AnyObject>
            if let json = response.result.value   {
                print("JSON: \(json)")
                
                    if let markers = json as? [NSDictionary] {
                        for marker in markers {
//                            print(user["Latitude"],user["Longitude"],user["title"],user["path"], separator: "   ", terminator: "\n")
                            
                            
                            
                            let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: Double((marker["Latitude"] as! NSString).doubleValue), longitude: Double((marker["Longitude"] as! NSString).doubleValue))
                            
//                            let latitudeCoordinate = Double(marker["Latitude"]!)
                            
//                            ! CLLocationDegrees
//                            let longitudeCoordinate = marker["Longitude"] as! CLLocationDegrees
//                            let location = CLLocationCoordinate2DMake(latitudeCoordinate, longitudeCoordinate)
                            
                            
                            let mapMarker = GMSMarker()
                            mapMarker.position = location
                            mapMarker.title = marker["title"] as? String
                            mapMarker.icon = UIImage(named: "greenPin")

                            mapMarker.map = self.googleMapView
                        }
                    }
                
                //var jsonObject = json as! [String: AnyObject]
                //var origin = jsonObject["Latitude"] as! String
               // print("latitude value: \(origin)")
//                if let latitude = json["Latitude"] as! [AnyObject]?
//                {
//                print("latitude are: \(latitude)")
//                }
                
                
                
//                let marker = GMSMarker()
//                marker.position = CLLocationCoordinate2D(latitude: 10.281228, longitude: -12.436104)
//                marker.title = "Kolentan Hospital"
//                let marker1 = GMSMarker()
//                marker1.position = CLLocationCoordinate2D(latitude: 10.203061, longitude: -12.765497)
//                marker1.title = "Tete Clinic"
//                let marker2 = GMSMarker()
//                marker2.position = CLLocationCoordinate2D(latitude: 9.633536, longitude: -13.576951)
//                marker2.title = "Conakry General Hospital"
//                let marker3 = GMSMarker()
//                marker3.position = CLLocationCoordinate2D(latitude: 9.762181, longitude: -13.484298)
//                marker3.title = "Kindia Pharmacy"
//                // marker.infoWindowAnchor = CGPoint(x: 0.5, y: 0.5)
//                marker.map = mapView
//                marker1.map = mapView
//                marker2.map = mapView
//                marker3.map = mapView
            }
        }
    }

}
