//
//  MainViewModel.swift
//  SocialRating
//
//  Created by Тимур Хазеев on 11.11.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class MainViewModel: ObservableObject {
  @Published var currentUserId: String = ""
  @Published var userRole: String = ""
  
  private var handler: AuthStateDidChangeListenerHandle?

  init() {
    self.handler = Auth.auth().addStateDidChangeListener {
      [weak self] _, user in
      DispatchQueue.main.async {
        self?.currentUserId = user?.uid ?? ""

        if let uid = user?.uid {
          self?.fetchUserRole(uid: uid)
        }
      }
    }
  }

  public var isSignedId: Bool {
    return Auth.auth().currentUser != nil
  }

  private func fetchUserRole(uid: String) {
    let db = Firestore.firestore()

    db.collection("users").document(uid).getDocument { document, error in
      if let document = document, document.exists {
        if let role = document.data()?["role"] as? String {
          DispatchQueue.main.async {
            self.userRole = role
          }
        }
      } 
    }
  }
}


