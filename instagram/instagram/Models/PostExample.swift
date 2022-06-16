//
//  Post.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import Foundation

struct PostExample: Identifiable {
    var id = UUID().uuidString
//    var poster: User.ID = Users.therock.id
//    var poster: String = Users.therock.id
    var time: Date = Date.now
    var image: String
    var isLiked: Bool = true
    var description: String = ""
    var storyName: String? = "Goodles"
}

struct PostsExample {
    static let rockPost1 = PostExample(
                                    image: "TR Post 1",
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
    static let rockPost2 = PostExample(image: "TR Post 2", description: """
                                    Rage against the dying of the light..

                                    Final work week of finishing touches for BLACK ADAM⚡️with my director, Jaume Collet-Serra.

                                    Our World Premiere Trailer drops JUNE 8th 🔥

                                    The hierarchy of power in the DC Universe is changing.

                                    #BlackAdam⚡️
                                    #ManInBlack
                                    #JSA
                                    #OfficialTrailer
                                    #June8th

                                    """)
    
    static let rockPost3 = PostExample(image: "TR Post 3", description: """
                                    Two of my favorite human beings to build business with 🥃

                                    @michaelseanbailey
                                    President of Walt Disney Studios Motion Pictures and founding @teremana investor 🥃

                                    @mayalasry
                                    Chief Marketing Officer for Seven Bucks Companies and founding @teremana investor 🥃 aka #bossmama

                                    They are the definition of “hardest workers in the room” and above all else, the audience always comes first.

                                    #WaltDisneyCompany
                                    #SevenBucksCompanies
                                    #build 🫱🏾‍🫲🏻

                                    """)
    
    static let obamaPost1 = PostExample(image: "BO Post 1", description: """
                                    On Memorial Day, we honor the memory of those who made the ultimate sacrifice for our country, and pray for their families—who still love and grieve for them. May God bless our fallen heroes and all who serve.
                                    """)
    
    static let obamaPost2 = PostExample(image: "BO Post 2", description: """
                                    In 2009, Carlton Philadelphia, a National Security Council staffer, brought his wife and two sons to the Oval Office for a departure photo. Carlton’s older son, Isaac, asked me a few serious questions, but a more surprising one came from his younger brother, five-year-old Jacob.

                                    “Is your hair like mine?” he asked.

                                    It wasn’t the kind of question I usually get.

                                    So, I bent down and told him, “Well you want to check and see? Go ahead, touch it.”

                                    And then I asked him, “Well, what do you think?”

                                    He replied, “Yeah, I think that’s pretty much what I’ve got. ”

                                    White House photographer @PeteSouza captured that moment and for years, the photo hung in the halls of the West Wing. It was a reminder of one of the reasons I first ran for president: that if I were to win, young people—Black kids, Hispanic kids, kids who may not have always felt like they belonged—might see more possibilities for their own future.

                                    It’s hard to believe 13 years have passed. Today, Jacob will graduate high school and continue on to the University of Memphis to study political science. And I couldn’t be more proud of him. We recently reconnected to reflect on that moment and his journey. Check out our reunion.

                                    Congratulations, Jacob, and best of luck to the Class of 2022!

                                    """)
    
    static let obamaPost3 = PostExample(image: "BO Post 3", description: """
                                    As we grieve the children of Uvalde today, we should take time to recognize that two years have passed since the murder of George Floyd under the knee of a police officer. His killing stays with us all to this day, especially those who loved him.

                                    In the aftermath of his murder, a new generation of activists rose up to channel their anguish into organized action, launching a movement to raise awareness of systemic racism and the need for criminal justice and police reform.

                                    Inspired by these young leaders, @MBK_Alliance launched a Reimagining Policing Pledge for mayors and cities ready to take action. If you’re wondering how you can help make things a little better today, click the link in my bio for some ways to get involved.

                                    """)
    
    static let obamaPost4 = PostExample(image: "BO Post 4", description: """
                                    Michelle and I grieve with the families in Uvalde, who are experiencing pain no one should have to bear.
                                    """)
    
    static let kevinHartPost1 = PostExample(image: "KH Post 1", description: """
                                    The Pre Sale Is Live Damn it!!!!!! The code is “COMEDY” ….Go to KevinHartNation.com NOOOWWW and get ur tickets!!!!!!! Let’s goooooo #RealityCheck #ComedicRockStarShit …..I’m about to make the FUCKING WORLD LAUGH. This will be my biggest tour yet!!!!! Hard Work Pays Off….This one will be special!!!!! Let’s fucking goooooooo
                                    """)
    
    static let kevinHartPost2 = PostExample(image: "KH Post 2", description: """
                                    Man From Toronto drops June 24th on @netflix ….Mark ya calendars people ….this movie is full of action and laughs!!!! #ManFromToronto
                                    """)
    
    static let kevinHartPost3 = PostExample(image: "KH Post 3", description: """
                                    Building a product from the ground up is Hard Work and for that reason alone is why Hard Work Should Taste Different….It should be premium and it should be the best. That is exactly what @grancoramino is damn it. It’s a “Cristalino” that will blow ur mind….I am loving all of the feedback and all of the love from you guys. I’m glad that you are all enjoying it….we busted our ass making it. A 4year process that was well worth the wait. Do me a favor and get some of that “Mino Lino” in ur system!!!!!! #HardWorkTasteDifferent #CelebrateYourJourney
                                    """)
    
    static let galGadotPost1 = PostExample(image: "GG Post 1", description: "")
    static let galGadotPost2 = PostExample(image: "GG Post 2", description: "")
    static let galGadotPost3 = PostExample(image: "GG Post 3", description: "")
    static let galGadotStory1 = PostExample(image: "GG Story Goodles", storyName: "Goodles")
    static let galGadotStory2 = PostExample(image: "GG Story Red Notice", storyName: "Red Notice")
    static let galGadotStory3 = PostExample(image: "GG Story Wonder Woman", storyName: "Wonder Woman")
    
    static let blakeLivelyPost1 = PostExample(image: "BL Post 1", description: """
                                    Let’s take it back to the “night before” party. A little hint of things to come🗽 thanks to @thombrowne Yes I took these on a self timer bc everyone was asleep when I got home at 9. Sorry outfit. You deserved better.
                                    """)
    static let blakeLivelyPost2 = PostExample(image: "BL Post 2", description: """
                                    This is my Met glam team @kristoferbuckle and @jennifer_yepez Yes they are gorgeous inside and out. Yes they make me feel gorgeous inside and out. Can’t forget @enamelle who’s not pictured. I love you three. And thank you @charlottetilbury for the gorgeous makeup. There’s a reason everything you create is the best— because it radiates just like you. Dream Glam Crew all around ✨ #charlottetilburypartner
                                    """)
    static let blakeLivelyPost3 = PostExample(image: "BL Post 3", description: """
                                    187.6 million hours of #theadamproject watched on @netflix so far! I’m back now. That was a commitment, but the gift was all mine— I’ll do anything for my new favorite movie. @slevydirect & @vancityreynolds please work together forever. Gotta find your next project ASAP!… Ok. Gonna scroll the internet now. Anything I missed??
                                    """)
    
    static let sushmitaSen1 = PostExample(image: "SS Post 1", description: """
                                    Up close & personal 😉❤️

                                    #selfportrait #raw #somethingaboutit 💋

                                    I love you guys!!!! #duggadugga 🤗😁💃🏻🌈

                                    """)
    static let sushmitaSen2 = PostExample(image: "SS Post 2", description: """
                                    I love you guys!!!! #beyond ❤️🎶
                                    Here’s wishing you a stunning #wednesday 😉😄🌈 #duggadugga
                                    """)
    static let sushmitaSen3 = PostExample(image: "SS Post 3", description: """
                                    Can’t change the situation…then, change your perspective!! 😉💋👍

                                    Feet walk… Hand stand!!😄👊❤️

                                    Hawks eyes @shivohamofficial 😀👊 #workinprogress 🙏

                                    I love you guys!!! #duggadugga 😍
                                    """)
}
