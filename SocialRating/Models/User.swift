//
//  Student.swift
//  SocialRating
//
//  Created by Тимур Хазеев on 11.11.2023.
//

import Foundation

struct User: Codable {
  let id: String
  let role: String
  let name: String
  let surname: String
  let patronymic: String
  let faculty: String
  let group: String
  let mail: String
  let phone: String
  let points: Int
}

