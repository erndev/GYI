//
//  YoutubeUrl.swift
//  GYI
//
//  Created by Ernesto García on 11/9/18.
//  Copyright © 2018 Spencer Curtis. All rights reserved.
//

import Foundation


class YoutubeUrl {
  private static let youtubeUrls = ["youtube.com", "www.youtube.com"]

  public static func isYoutubeUrl( string:String) -> Bool {
    guard let url = URL(string:string) else {
      return false;
    }
    return isYoutubeUrl(url: url);
  }
  
  public static func isYoutubeUrl(url:URL) -> Bool {
    // Youtube video:
    // host = youtube.com or www.youtube.com
    // path is /watch
    // needs to have a "v" queryItem
    guard  let urlComponents = URLComponents(url:url, resolvingAgainstBaseURL:false) else {
        return false;
    }
    guard let host = urlComponents.host, youtubeUrls.contains(host) else {
      return false;
    }
    guard urlComponents.path == "/watch" else{
      return false;
    }
    guard let contains = urlComponents.queryItems?.contains(where: { $0.name == "v" }), contains else {
      return false;
    }
    return true;
  }
}
