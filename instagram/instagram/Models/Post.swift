//
//  Post.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import Foundation

struct Post: Identifiable {
    var id = UUID().uuidString
    var poster: User = Users.therock
    var time: Date = Date.now
    var image: String
    var isLiked: Bool = false
    var description: String = ""
}

struct Posts {
    static let rockPost2 = Post(
                                    poster: Users.therock,
                                    image: "TR Post 2",
                                    description: """
                                    In 2 days.
                                    World premiere trailer of #BlackAdam⚡️
                                    June 8th

                                    * here’s a cool bts pic from set of the man in black who can fly at the speed of light, but often….hovers.
                                    #mentalchess ♟💀
                                    #blackadam ⚡️
                                    #JSA
                                    """
                               )
    static let rockPost5 = Post(
                                    poster: Users.therock,
                                    image: "TR Post 5",
                                    description: """
                                    The leg training savagery tonight was a whole crazy intense mood 💀👹🔥 but overall, grateful for another solid training session.
                                    
                                    For months now after multiple workouts in multiple shoe stages, I can 💯 confirm now - these new prototype @projectrock PR5s 👟 are gonna be WINNERS.

                                    Most durable & innovative to date.
                                    We’ve been working on a new dual midsole cushion system, and still able to keep the soft responsiveness of our signature HOVR technology at the core. Greater stability laterally and when it’s time to go savage mode to crush any workout you set your mind to - this shoe will deliver.

                                    I’ll bring these to market for you guys this FALL!
                                    In multiple color ways 🔥

                                    Train hard. Stay strong. Enjoy your weekend.

                                    #PrototypeTesting
                                    #PR5s 👟
                                    #projectrock
                                    #ironparadise

                                    """
                               )
    static let rockPost8a = Post(poster: Users.therock, image: "TR Post 8a", description: "")
    static let rockPost8b = Post(poster: Users.therock, image: "TR Post 8b", description: "")
    static let rockPost8c = Post(poster: Users.therock, image: "TR Post 8c", description: "")
    static let rockPost9 = Post(poster: Users.therock, image: "TR Post 9", description: "")
}
