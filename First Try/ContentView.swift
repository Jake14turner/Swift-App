//
//  ContentView.swift
//  First Try
//
//  Created by jake turner on 11/21/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        contentView()
    }
}

#Preview {
    ContentView()
}


struct storyboardview: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "Home")
        return controller
        
        
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}


struct storyboardview2: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let storyboard2 = UIStoryboard(name: "Main2", bundle: Bundle.main)
        let controller2 = storyboard2.instantiateViewController(identifier: "ViewController2")
        return controller2
    }
    func updateUIViewController(_ uiViewController2: UIViewController, context: Context) {

    }
}


struct storyboardview3: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let storyboard3 = UIStoryboard(name: "Main3", bundle: Bundle.main)
        let controller3 = storyboard3.instantiateViewController(identifier: "ViewController30")
        return controller3
    }
    func updateUIViewController(_ uiViewController2: UIViewController, context: Context) {

    }
}

struct storyboardview4: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let storyboard3 = UIStoryboard(name: "Main4", bundle: Bundle.main)
        let controller3 = storyboard3.instantiateViewController(identifier: "home99")
        return controller3
    }
    func updateUIViewController(_ uiViewController2: UIViewController, context: Context) {

    }
}

struct Main5: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let tops = UIStoryboard(name: "Main5", bundle: Bundle.main)
        let topss = tops.instantiateViewController(identifier: "ViewController300")
        return topss
    }
    func updateUIViewController(_ uiViewController300: UIViewController, context: Context) {

    }
}


struct Main4: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let tops = UIStoryboard(name: "Main4", bundle: Bundle.main)
        let topss = tops.instantiateViewController(identifier: "ViewController200")
        return topss
    }
    func updateUIViewController(_ uiViewController200: UIViewController, context: Context) {

    }
}

struct Main3: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let tops = UIStoryboard(name: "Main3", bundle: Bundle.main)
        let topss = tops.instantiateViewController(identifier: "ViewController100")
        return topss
    }
    func updateUIViewController(_ uiViewController100: UIViewController, context: Context) {

    }
}


struct Main10: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let tops = UIStoryboard(name: "thisWillWork", bundle: Bundle.main)
        let topss = tops.instantiateViewController(identifier: "puppy")
        return topss
    }
    func updateUIViewController(_ uipuppy: UIViewController, context: Context) {

    }
}
