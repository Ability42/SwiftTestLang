//: Playground - noun: a place where people can play

import UIKit


struct iOSDevelopmentBlog {
    let name: String?
    let URL: String?
    let Author: String?
}


func originalStyleLongComplimentAboutBlog(blog: iOSDevelopmentBlog) {
    
    if let blogName = blog.name, let blogAuthor = blog.Author, let blogURL = blog.URL {
            print("It's names \(blogName)")
            print("It is written by \(blogAuthor).")
            print("Visit it at \(blogURL)")
    } else {
        print("Information couldn't be found")
    }
}

func shortStyleWithGuardStatement(blog : iOSDevelopmentBlog) {
    guard let blogName = blog.name,
        let blogAuthor = blog.Author,
        let blogURL = blog.URL else {
            print("Information couldn't be found")
            return
    }
    
    print("The name is \(blogName)")
    print("The author is \(blogAuthor)")
    print("Visit it at \(blogURL)")
}

let NSHipsterBlog = iOSDevelopmentBlog(name: "NSHipster", URL: nil, Author: "Nate Cook")

shortStyleWithGuardStatement(blog: NSHipsterBlog)


//: Transfer Control

let myNumbers: [Int?] = [1,2,3,nil,42]


for num in myNumbers {
    guard let magicNum = num else {
        print("< no value>")
//        continue
        break
    }
    print(num!)
}





