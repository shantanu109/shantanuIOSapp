//
//  QuestionBank.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 19/06/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import Foundation

class QuestionBank
{
    var list = [Question]()
    
    init()
    {
        list.append(Question(questionText: "In the video, the move from traditional bookkeeping to cryptocurrency is described as:", choiceA: "(a) Elimination of the middlemen or third parties", choiceB: "(b) Collective bookkeeping via the internet", choiceC: "(c) Both A and B", choiceD: "(d) None of the above", answer: 3))
        list.append(Question(questionText: "Bitcoin software enables a network of computers to maintain a digital ledger that is", choiceA: "(a) Public and fully distributable across the network", choiceB: "(b) Private and not fully distributable", choiceC: "(c) Fully distributable but private", choiceD: "(d) None of the above", answer: 1))
        list.append(Question(questionText: "In the blockchain, which of the following information on the transactions are logged:", choiceA: "(a) Date and time", choiceB: "(b) Participants", choiceC: "(c) Amount of every single transaction", choiceD: "(d) All of the above", answer: 4))
        list.append(Question(questionText: "What is the name given to those who verify a transaction and maintain the ledger in a blockchain?", choiceA: "(a) Bitcoin Server", choiceB: "(b) Bitcoin Bookkeeper", choiceC: "(c) Bitcoin Miner", choiceD: "(d) Blockchain Facilitator", answer: 3))
        list.append(Question(questionText: "Which feature of a blockchain makes it seem like a notary is present at every transaction?", choiceA: "(a) For a transaction to take place, all nodes have to unanimously agree that it has occured at the given date and time", choiceB: "(b) There are physical checks at every point", choiceC: "(c) All nodes have access to the digital ledger", choiceD: "(d) All of the above", answer: 1))
        list.append(Question(questionText: "What are the benefits of the blockchain technology?", choiceA: "(a) It is compliancy upfront", choiceB: "(b) It is transparent and results in a significant decrease in bureaucracy", choiceC: "(c) It leads to time savings for the accountants and the controllers in organisations", choiceD: "(d) All of the above", answer: 4))
        list.append(Question(questionText: "As discussed in the video, each individual unit is programmable and can be assigned different properties by the users. Which of the following CANNOT be represented by a bitcoin unit?", choiceA: "(a) A currency unit", choiceB: "(b) A Kilowatt of energy", choiceC: "(c) A share of a company", choiceD: "(d) None of the above", answer: 4))
        list.append(Question(questionText: "What can be one of the benefits of the bitcoin software for businesses and companies?", choiceA: "(a) Amount specified for a certain purpose cannot be used for any other activity", choiceB: "(b) There will be no spending limits", choiceC: "(c) The bitcoin ethics committee will keep a check on everything", choiceD: "(d) There are no such benefits mentioned in the video", answer: 1))
         list.append(Question(questionText: "According to the survey conducted by the World Economic Forum’s Global Agenda Council, only  _____ percent of the global GDP, amounting to _____, is currently held in the blockchain.", choiceA: "(a) 0.5, $20 billion", choiceB: "(b) 0.025, $20 billion", choiceC: "(c) 0.025, $20 million", choiceD: "(d) 0.005, $10 billion", answer: 2))
         list.append(Question(questionText: "According to the video, internet technology is disruptive because:", choiceA: "(a) It breaks the status quo", choiceB: "(b) It opens markets", choiceC: "(c) Breaks the position of middlemen", choiceD: "(d) All of the above", answer: 4))
       
    }
}
