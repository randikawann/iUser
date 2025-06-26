//
//  EndPoints.swift
//  iUser
//
//  Created by ranCreation on 2025-06-26.
//

enum Endpoint {
    case getRandomUsers
    
    var url: String {
        switch self {
        case .getRandomUsers:
//            return "https://mocki.io/v1/4a602390-f62c-4ed1-b6f0-d37f759115dd"
            return "https://mocki.io/v1/3e0234d8-f40b-4ad6-871f-179e4e657bed"
        }
    }
}

//TODO: This is json which i used
/*
 
 {
   "results": [
     {
       "gender": "female",
       "name": { "title": "Ms", "first": "Jane", "last": "Doe" },
       "email": "user1@example.com",
       "phone": "123-456-0001",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     },
     {
       "gender": "male",
       "name": { "title": "Mr", "first": "John", "last": "Smith" },
       "email": "user2@example.com",
       "phone": "123-456-0002",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=1Szx0Rk-G_wibhWjG8IDlv9t7C0-kWVKf",
         "thumbnail": "https://drive.google.com/uc?export=view&id=1OeHpLB0b6Jq3UDYo0Cr8yPWoO5U9KYvx"
       }
     },
     {
       "gender": "female",
       "name": { "title": "Mrs", "first": "Emily", "last": "White" },
       "email": "user3@example.com",
       "phone": "123-456-0003",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     },
     {
       "gender": "female",
       "name": { "title": "Ms", "first": "Sophia", "last": "Brown" },
       "email": "user4@example.com",
       "phone": "123-456-0004",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=1OeHpLB0b6Jq3UDYo0Cr8yPWoO5U9KYvx",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     },
     {
       "gender": "male",
       "name": { "title": "Mr", "first": "William", "last": "Davis" },
       "email": "user5@example.com",
       "phone": "123-456-0005",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=1Szx0Rk-G_wibhWjG8IDlv9t7C0-kWVKf"
       }
     },
     {
       "gender": "female",
       "name": { "title": "Ms", "first": "Olivia", "last": "Wilson" },
       "email": "user6@example.com",
       "phone": "123-456-0006",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     },
     {
       "gender": "male",
       "name": { "title": "Mr", "first": "Liam", "last": "Taylor" },
       "email": "user7@example.com",
       "phone": "123-456-0007",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=1OeHpLB0b6Jq3UDYo0Cr8yPWoO5U9KYvx",
         "thumbnail": "https://drive.google.com/uc?export=view&id=1Szx0Rk-G_wibhWjG8IDlv9t7C0-kWVKf"
       }
     },
     {
       "gender": "female",
       "name": { "title": "Mrs", "first": "Isabella", "last": "Moore" },
       "email": "user8@example.com",
       "phone": "123-456-0008",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     },
     {
       "gender": "male",
       "name": { "title": "Mr", "first": "James", "last": "Anderson" },
       "email": "user9@example.com",
       "phone": "123-456-0009",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=1Szx0Rk-G_wibhWjG8IDlv9t7C0-kWVKf"
       }
     },
     {
       "gender": "female",
       "name": { "title": "Ms", "first": "Ava", "last": "Martin" },
       "email": "user10@example.com",
       "phone": "123-456-0010",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=1OeHpLB0b6Jq3UDYo0Cr8yPWoO5U9KYvx",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     },
     {
       "gender": "male",
       "name": { "title": "Mr", "first": "Noah", "last": "Lee" },
       "email": "user11@example.com",
       "phone": "123-456-0011",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     },
     {
       "gender": "female",
       "name": { "title": "Ms", "first": "Charlotte", "last": "Clark" },
       "email": "user12@example.com",
       "phone": "123-456-0012",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=1OeHpLB0b6Jq3UDYo0Cr8yPWoO5U9KYvx"
       }
     },
     {
       "gender": "male",
       "name": { "title": "Mr", "first": "Benjamin", "last": "Walker" },
       "email": "user13@example.com",
       "phone": "123-456-0013",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     },
     {
       "gender": "female",
       "name": { "title": "Mrs", "first": "Mia", "last": "Hall" },
       "email": "user14@example.com",
       "phone": "123-456-0014",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     },
     {
       "gender": "male",
       "name": { "title": "Mr", "first": "Lucas", "last": "Young" },
       "email": "user15@example.com",
       "phone": "123-456-0015",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     },
     {
       "gender": "female",
       "name": { "title": "Ms", "first": "Amelia", "last": "King" },
       "email": "user16@example.com",
       "phone": "123-456-0016",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     },
     {
       "gender": "male",
       "name": { "title": "Mr", "first": "Elijah", "last": "Wright" },
       "email": "user17@example.com",
       "phone": "123-456-0017",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     },
     {
       "gender": "female",
       "name": { "title": "Mrs", "first": "Harper", "last": "Scott" },
       "email": "user18@example.com",
       "phone": "123-456-0018",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     },
     {
       "gender": "male",
       "name": { "title": "Mr", "first": "Henry", "last": "Green" },
       "email": "user19@example.com",
       "phone": "123-456-0019",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     },
     {
       "gender": "female",
       "name": { "title": "Ms", "first": "Evelyn", "last": "Baker" },
       "email": "user20@example.com",
       "phone": "123-456-0020",
       "picture": {
         "large": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01",
         "thumbnail": "https://drive.google.com/uc?export=view&id=15riu-sJBysayebMG-L6RUb4Fmq8DsM01"
       }
     }
   ]
 }
 
 */
