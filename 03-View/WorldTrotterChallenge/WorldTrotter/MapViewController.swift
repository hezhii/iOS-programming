//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by 何洲 on 2021/8/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view.")
    }
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
        let segmentedControl = UISegmentedControl(items:  ["Standard", "Hybrid", "Satellite"])
//        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged), for: UIControl.Event.valueChanged)
        
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        let label = UILabel()
        label.text = "Points of Interest"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16).isActive = true
        label.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor).isActive = true
        
        
        let uiSwitch = UISwitch()
        uiSwitch.isOn = true
        uiSwitch.translatesAutoresizingMaskIntoConstraints = false
        uiSwitch.addTarget(self, action: #selector(interestChanged), for: .valueChanged)
        view.addSubview(uiSwitch)
        uiSwitch.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8).isActive = true
        uiSwitch.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        // mapView.mapType 本身就是 MKMapType 枚举类型，所以设定它的值时可以不用写类型
        case 0:
            mapView.mapType = MKMapType.standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    @objc func interestChanged(_ uiSwitch: UISwitch) {
        if uiSwitch.isOn {
            mapView.pointOfInterestFilter = .includingAll
        } else {
            mapView.pointOfInterestFilter = .excludingAll
        }
    }
}
