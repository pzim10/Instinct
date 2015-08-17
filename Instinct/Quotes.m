//
//  Quotes.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/17/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "Quotes.h"

static NSString const *AuthorKey = @"AuthorKey";
static NSString const *QuoteKey = @"QuoteKey";

@implementation Quotes

+(NSString *)getQuoteWithAuthor{
    NSDictionary *dict = [self quotes][rand() % 119];
    NSString *quote = dict[QuoteKey];
    NSString*author = dict[AuthorKey];
    return [NSString stringWithFormat:@"%@\n\n%@", quote, author];
    
}

+(NSArray *)quotes {
    NSArray *quotes = @[
                        @{
                            AuthorKey:@"-Og Mandino",
                            QuoteKey:@"Failure will never overtake me if my determination to succeed is strong enough."
                            },
                        @{
                            AuthorKey:@"-Og Mandino",
                            QuoteKey:@"Always do your best. What you plant now, you will harvest later.",
                            },
                        @{
                            AuthorKey:@"-Og Mandino",
                            QuoteKey:@"I will love the light for it shows me the way, yet I will endure the darkness because it shows me the stars.",
                            },
                        @{
                            AuthorKey:@"-Og Mandino",
                            QuoteKey:@"Always seek out the seed of triumph in every adversity.",
                            },
                        @{
                            AuthorKey:@"-Og Mandino",
                            QuoteKey:@"Take the attitude of a student, never be too big to ask questions, never know too much to learn something new.",
                            },
                        @{
                            AuthorKey:@"-Og Mandino",
                            QuoteKey:@"Obstacles are necessary for success because... victory comes only after many struggles and countless defeats.",
                            },
                        @{
                            AuthorKey:@"-Ralph Marston",
                            QuoteKey:@"What you do today can improve all your tomorrows.",
                            },
                        @{
                            AuthorKey:@"-Nikos Kazantzakis",
                            QuoteKey:@"In order to succeed, we must first believe that we can.",
                            },
                        @{
                            AuthorKey:@"-Leo Buscaglia",
                            QuoteKey:@"Your talent is God's gift to you. What you do with it is your gift back to God.",
                            },
                        @{
                            AuthorKey:@"-C.S. Lewis",
                            QuoteKey:@"You are never too old to set another goal or to dream a new dream.",
                            },
                        @{
                            AuthorKey:@"-Napoleon Hill",
                            QuoteKey:@"A goal is a dream with a deadline.",
                            },
                        @{
                            AuthorKey:@"-Ayn Rand",
                            QuoteKey:@"A creative man is motivated by the desire to achieve, not by the desire to beat others.",
                            },
                        @{
                            AuthorKey:@"-Confucius",
                            QuoteKey:@"It does not matter how slowly you go as long as you do not stop.",
                            },
                        @{
                            AuthorKey:@"-Eleanor Roosevelt",
                            QuoteKey:@"With the new day comes new strength and new thoughts.",
                            },
                        @{
                            AuthorKey:@"-San Levenson",
                            QuoteKey:@"Don't watch the clock; do what it does. Keep going.",
                            },
                        @{
                            AuthorKey:@"-Theodore Roosevelt",
                            QuoteKey:@"Keep your eyes on the stars, and your feet on the ground.",
                            },
                        @{
                            AuthorKey:@"-Thomas Edison",
                            QuoteKey:@"Our greatest weakness lies in giving up. The most certain way to succeed is always to try just one more time.",
                            },
                        @{
                            AuthorKey:@"-Norman Vincent Peale",
                            QuoteKey:@"Believe in yourself! Have faith in your abilities! Without a humble but reasonable confidence in your own powers you cannot be successful or happy.",
                            },
                        @{
                            AuthorKey:@"-Albert Einstein",
                            QuoteKey:@"You have to learn the rules of the game. And then you have to play better than anyone else.",
                            },
                        @{
                            AuthorKey:@"-Walt Disney",
                            QuoteKey:@"If you can dream it, you can do it.",
                            },
                        @{
                            AuthorKey:@"-Robert H. Schuller",
                            QuoteKey:@"Problems are not stop signs, they are guidelines.",
                            },
                        @{
                            AuthorKey:@"-Mark Twain",
                            QuoteKey:@"The secret of getting ahead is getting started.",
                            },
                        @{
                            AuthorKey:@"-Confucius",
                            QuoteKey:@"The will to win, the desire to succeed, the urge to reach your full potential... these are the keys that will unlock the door to personal excellence.",
                            },
                        @{
                            AuthorKey:@"-Alfred A. Montapert",
                            QuoteKey:@"Expect problems and eat them for breakfast.",
                            },
                        @{
                            AuthorKey:@"-Maya Angelou",
                            QuoteKey:@"We may encounter many defeats but we must not be defeated.",
                            },
                        @{
                            AuthorKey:@"-Aldous Huxley",
                            QuoteKey:@"There is only one corner of the universe you can be certain of improving, and that's your own self.",
                            },
                        @{
                            AuthorKey:@"-Arthur Ashe",
                            QuoteKey:@"Start where you are. Use what you have. Do what you can.",
                            },
                        @{
                            AuthorKey:@"-John F. Kennedy",
                            QuoteKey:@"Things do not happen. Things are made to happen.",
                            },
                        @{
                            AuthorKey:@"-Helen Keller",
                            QuoteKey:@"Optimism is the faith that leads to achievement. Nothing can be done without hope and confidence.",
                            },
                        @{
                            AuthorKey:@"-Harriet Beecher Stowe",
                            QuoteKey:@"Never give up, for that is just the place and time that the tide will turn.",
                            },
                        @{
                            AuthorKey:@"-George S. Patton",
                            QuoteKey:@"Accept the challenges so that you can feel the exhilaration of victory.",
                            },
                        @{
                            AuthorKey:@"-Gordon B. Hinckley",
                            QuoteKey:@"Without hard work, nothing grows but weeds.",
                            },
                        @{
                            AuthorKey:@"-Zig Ziglar",
                            QuoteKey:@"What you get by achieving your goals is not as important as what you become by achieving your goals.",
                            },
                        @{
                            AuthorKey:@"-Victor Kiam",
                            QuoteKey:@"Even if you fall on your face, you're still moving forward.",
                            },
                        @{
                            AuthorKey:@"-Lao Tzu",
                            QuoteKey:@"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step.",
                            },
                        @{
                            AuthorKey:@"-Epictetus",
                            QuoteKey:@"The key is to keep company only with people who uplift you, whose presence calls forth your best.",
                            },
                        @{
                            AuthorKey:@"-Winston Churchill",
                            QuoteKey:@"If you're going through hell, keep going.",
                            },
                        @{
                            AuthorKey:@"-Benjamin Franklin",
                            QuoteKey:@"By failing to prepare, you are preparing to fail.",
                            },
                        @{
                            AuthorKey:@"-Pope John XXIII",
                            QuoteKey:@"Consult not your fears but your hopes and your dreams. Think not about your frustrations, but about your unfulfilled potential. Concern yourself not with what you tried and failed in, but with what it is still possible for you to do.",
                            },
                        @{
                            AuthorKey:@"-Muhammad Ali",
                            QuoteKey:@"I know where I'm going and I know the truth, and I don't have to be what you want me to be. I'm free to be what I want.",
                            },
                        @{
                            AuthorKey:@"-Julie Andrews",
                            QuoteKey:@"Perseverance is failing 19 times and succeeding the 20th.",
                            },
                        @{
                            AuthorKey:@"-Tony Robbins",
                            QuoteKey:@"Setting goals is the first step in turning the invisible into the visible.",
                            },
                        @{
                            AuthorKey:@"-Oprah Winfrey",
                            QuoteKey:@"The only people who never tumble are those who never mount the high wire. This is your moment. Own it.",
                            },
                        @{
                            AuthorKey:@"-Philip Sidney",
                            QuoteKey:@"Either I will find a way, or I will make one.",
                            },
                        @{
                            AuthorKey:@"-Aristotle",
                            QuoteKey:@"Quality is not an act, it is a habit.",
                            },
                        @{
                            AuthorKey:@"-Woodrow Wilson",
                            QuoteKey:@"You are not here merely to make a living. You are here in order to enable the world to live more amply, with greater vision, with a finer spirit of hope and achievement. You are here to enrich the world, and you impoverish yourself if you forget the errand.",
                            },
                        @{
                            AuthorKey:@"-Thomas Edison",
                            QuoteKey:@"There's a way to do it better - find it.",
                            },
                        @{
                            AuthorKey:@"-Winston Churchill",
                            QuoteKey:@"Never, never, never give up.",
                            },
                        @{
                            AuthorKey:@"-Albert Schweitzer",
                            QuoteKey:@"Do something wonderful, people may imitate it.",
                            },
                        @{
                            AuthorKey:@"-Thomas Paine",
                            QuoteKey:@"The harder the conflict, the more glorious the triumph.",
                            },
                        @{
                            AuthorKey:@"-Babe Ruth",
                            QuoteKey:@"You just can't beat the person who never gives up.",
                            },
                        @{
                            AuthorKey:@"-Carl von Clausewitz",
                            QuoteKey:@"Pursue one great decisive aim with force and determination.",
                            },
                        @{
                            AuthorKey:@"-John W. Gardner",
                            QuoteKey:@"True happiness involves the full use of one's power and talents.",
                            },
                        @{
                            AuthorKey:@"-Christopher Reeve",
                            QuoteKey:@"Don't give up. Don't lose hope. Don't sell out.",
                            },
                        @{
                            AuthorKey:@"-Beverly Sills",
                            QuoteKey:@"I've always tried to go a step past wherever people expected me to end up.",
                            },
                        @{
                            AuthorKey:@"-Bo Jackson",
                            QuoteKey:@"Set your goals high, and don't stop till you get there.",
                            },
                        @{
                            AuthorKey:@"-Norman Ralph Augustine",
                            QuoteKey:@"Motivation will almost always beat mere talent.",
                            },
                        @{
                            AuthorKey:@"-Elon Musk",
                            QuoteKey:@"When something is important enough, you do it even if the odds are not in your favor.",
                            },
                        @{
                            AuthorKey:@"-Dan Millman",
                            QuoteKey:@"I learned that we can do anything, but we can't do everything... at least not at the same time. So think of your priorities not in terms of what activities you do, but when you do them. Timing is everything.",
                            },
                        @{
                            AuthorKey:@"-Daniel Webster",
                            QuoteKey:@"There is always room at the top.",
                            },
                        @{
                            AuthorKey:@"-William Hazlitt",
                            QuoteKey:@"The more we do, the more we can do."
                            },
                        @{
                            AuthorKey:@"-Muhammad Iqbal",
                            QuoteKey:@"The ultimate aim of the ego is not to see something, but to be something.",
                            },
                        @{
                            AuthorKey:@"-Jim Rohn",
                            QuoteKey:@"If you don't design your own life plan, chances are you'll fall into someone else's plan. And guess what they have planned for you? Not much.",
                            },
                        @{
                            AuthorKey:@"-Florence Nightingale",
                            QuoteKey:@"I attribute my success to this - I never gave or took any excuse.",
                            },
                        @{
                            AuthorKey:@"-Benjamin Franklin",
                            QuoteKey:@"Well done is better than well said.",
                            },
                        @{
                            AuthorKey:@"-W. Clement Stone",
                            QuoteKey:@"Aim for the moon. If you miss, you may hit a star.",
                            },
                        @{
                            AuthorKey:@"-George Lucas",
                            QuoteKey:@"You simply have to put one foot in front of the other and keep going. Put blinders on and plow right ahead.",
                            },
                        @{
                            AuthorKey:@"-Sasha Cohen",
                            QuoteKey:@"Follow your dreams, work hard, practice and persevere. Make sure you eat a variety of foods, get plenty of exercise and maintain a healthy lifestyle.",
                            },
                        @{
                            AuthorKey:@"-Eileen Caddy",
                            QuoteKey:@"Set your sights high, the higher the better. Expect the most wonderful things to happen, not in the future but right now. Realize that nothing is too good. Allow absolutely nothing to hamper you or hold you up in any way.",
                            },
                        @{
                            AuthorKey:@"-John Burroughs",
                            QuoteKey:@"If you think you can do it, you can.",
                            },
                        @{
                            AuthorKey:@"-George Herbert",
                            QuoteKey:@"Do not wait; the time will never be 'just right.' Start where you stand, and work with whatever tools you may have at your command, and better tools will be found as you go along.",
                            },
                        @{
                            AuthorKey:@"-Sophocles",
                            QuoteKey:@"Who seeks shall find.",
                            },
                        @{
                            AuthorKey:@"-Jim Rohn",
                            QuoteKey:@"Either you run the day or the day runs you.",
                            },
                        @{
                            AuthorKey:@"-H. Jackson Brown Jr.",
                            QuoteKey:@"You must take action now that will move you towards your goals. Develop a sense of urgency in your life.",
                            },
                        @{
                            AuthorKey:@"-Rose Kennedy",
                            QuoteKey:@"I know not age, nor weariness nor defeat.",
                            },
                        @{
                            AuthorKey:@"-Ted Turner",
                            QuoteKey:@"You can never quit. Winners never quit, and quitters never win.",
                            },
                        @{
                            AuthorKey:@"-St. Jerome",
                            QuoteKey:@"Good, better, best. Never let it rest. 'Til your good is better and your better is best.",
                            },
                        @{
                            AuthorKey:@"-Mary Pickford",
                            QuoteKey:@"The past cannot be changed. The future is yet in your power.",
                            },
                        @{
                            AuthorKey:@"-Baltasar Gracian",
                            QuoteKey:@"Know or listen to those who know.",
                            },
                        @{
                            AuthorKey:@"-Peter Marshall",
                            QuoteKey:@"Small deeds done are better than great deeds planned.",
                            },
                        @{
                            AuthorKey:@"-Tom Stoppard",
                            QuoteKey:@"Every exit is an entry somewhere else.",
                            },
                        @{
                            AuthorKey:@"-Mia Hamm",
                            QuoteKey:@"I've worked too hard and too long to let anything stand in the way of my goals. I will not let my teammates down and I will not let myself down.",
                            },
                        @{
                            AuthorKey:@"-Amelia Earhart",
                            QuoteKey:@"The most effective way to do it, is to do it.",
                            },
                        @{
                            AuthorKey:@"-Henry Ford",
                            QuoteKey:@"You can't build a reputation on what you are going to do.",
                            },
                        @{
                            AuthorKey:@"-Herbert Simon",
                            QuoteKey:@"One finds limits by pushing them.",
                            },
                        @{
                            AuthorKey:@"-Ken Venturi",
                            QuoteKey:@"I don't believe you have to be better than everybody else. I believe you have to be better than you ever thought you could be.",
                            },
                        @{
                            AuthorKey:@"-Mark Caine",
                            QuoteKey:@"The first step toward success is taken when you refuse to be a captive of the environment in which you first find yourself.",
                            },
                        @{
                            AuthorKey:@"-Diane Sawyer",
                            QuoteKey:@"Whatever you want in life, other people are going to want it too. Believe in yourself enough to accept the idea that you have an equal right to it.",
                            },
                        @{
                            AuthorKey:@"-H.L. Hunt",
                            QuoteKey:@"Decide what you want, decide what you are willing to exchange for it. Establish your priorities and go to work.",
                            },
                        @{
                            AuthorKey:@"-Wayne Dyer",
                            QuoteKey:@"Be miserable. Or motivate yourself. Whatever has to be done, it's always your choice.",
                            },
                        @{
                            AuthorKey:@"-Robert H. Schuller",
                            QuoteKey:@"I'd rather attempt to do something great and fail than to attempt to do nothing and succeed.",
                            },
                        @{
                            AuthorKey:@"-Jessica Savitch",
                            QuoteKey:@"No matter how many goals you have achieved, you must set your sights on a higher one.",
                            },
                        @{
                            AuthorKey:@"-Wayne Dyer",
                            QuoteKey:@"Go for it now. The future is promised to no one.",
                            },
                        @{
                            AuthorKey:@"-Carl Sandburg",
                            QuoteKey:@"To be a good loser is to learn how to win.",
                            },
                        @{
                            AuthorKey:@"-Joan of Arc",
                            QuoteKey:@"I am not afraid... I was born to do this.",
                            },
                        @{
                            AuthorKey:@"-Carol Burnett",
                            QuoteKey:@"Only I can change my life. No one can do it for me.",
                            },
                        @{
                            AuthorKey:@"-Richard Rorty",
                            QuoteKey:@"There is nothing deep down inside us except what we have put there ourselves.",
                            },
                        @{
                            AuthorKey:@"-Michael Korda",
                            QuoteKey:@"One way to keep momentum going is to have constantly greater goals.",
                            },
                        @{
                            AuthorKey:@"Denis Diderot",
                            QuoteKey:@"You have to make it happen.",
                            },
                        @{
                            AuthorKey:@"-Ralph Waldo Emerson",
                            QuoteKey:@"We aim above the mark to hit the mark.",
                            },
                        @{
                            AuthorKey:@"-Persius",
                            QuoteKey:@"He conquers who endures.",
                            },
                        @{
                            AuthorKey:@"-Charlotte Whitton",
                            QuoteKey:@"When one must, one can.",
                            },
                        @{
                            AuthorKey:@"-Sophocles",
                            QuoteKey:@"Always desire to learn something useful.",
                            },
                        @{
                            AuthorKey:@"-Octavio Paz",
                            QuoteKey:@"Deserve your dream.",
                            },
                        @{
                            AuthorKey:@"-Brian Tracy",
                            QuoteKey:@"I've found that luck is quite predictable. If you want more luck, take more chances. Be more active. Show up more often.",
                            },
                        @{
                            AuthorKey:@"-Kyle Chandler",
                            QuoteKey:@"Opportunity does not knock, it presents itself when you beat down the door.",
                            },
                        @{
                            AuthorKey:@"-Norman Vincent Peale",
                            QuoteKey:@"It's always too early to quit.",
                            },
                        @{
                            AuthorKey:@"-Donna Brazile",
                            QuoteKey:@"I was motivated to be different in part because I was different.",
                            },
                        @{
                            AuthorKey:@"-Jim Carrey",
                            QuoteKey:@"If you've got a talent, protect it.",
                            },
                        @{
                            AuthorKey:@"-Thomas Jefferson",
                            QuoteKey:@"Determine never to be idle. No person will have occasion to complain of the want of time who never loses any. It is wonderful how much may be done if we are always doing.",
                            },
                        @{
                            AuthorKey:@"-William James",
                            QuoteKey:@"Act as if what you do makes a difference. It does.",
                            },
                        @{
                            AuthorKey:@"-Denis Waitley",
                            QuoteKey:@"Learn from the past, set vivid, detailed goals for the future, and live in the only moment of time over which you have any control: now.",
                            },
                        @{
                            AuthorKey:@"-Jim Elliot",
                            QuoteKey:@"Wherever you are - be all there.",
                            },
                        @{
                            AuthorKey:@"-John Burroughs",
                            QuoteKey:@"A somebody was once a nobody who wanted to and did.",
                            },
                        @{
                            AuthorKey:@"-Virgil",
                            QuoteKey:@"They can conquer who believe they can.",
                            },
                        @{
                            AuthorKey:@"-Leo Durocher",
                            QuoteKey:@"I come to win.",
                            },
                        @{
                            AuthorKey:@"-Oliver Herford",
                            QuoteKey:@"Many are called but few get up.",
                            },
                        @{
                            AuthorKey:@"-Ezra Pound",
                            QuoteKey:@"Either move or be moved.",
                            },
                        @{
                            AuthorKey:@"-Woody Hayes",
                            QuoteKey:@"Success is the only motivational factor that a boy with character needs.",
                            }
                        ];
    
    return quotes;
}



@end
