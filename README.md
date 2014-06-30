Loopoll
=======
###Intro

Have questions on which you'd like to poll others? 

Want to provide feedback by voting?

Use feedback loops through Loopoll! 


###Voting
Users must have an account to vote, 
  can only vote on questions (created by other users - not on their own!) until the due date,
  and each user can only vote once(!) on any question - there are no loopholes with Loopoll!

###Login

Sign up (or log in if you already have an account) via http://0:0:0:0!

- If you'd like to test Loopoll before creating an account, log in with email: test@test and pwd: test.
- Once logged in, your name will display in the top nav, next to the logout button.

###Features

- Your dashboard includes: 
    - The ability to create a yes/no question right there on the spot! Just type it in and click submit!
    - A link to create a multiple choice (2 - 5 choices only) question.
    - Summaries of:
        - Active questions you've created (incl. days left until the poll closes &amp; results thus far), 
        - Questions you've already answered, and 
        - Active questions created by other users that you haven't yet answered (incl. days left until the poll closes).
                < NOTE: An `active` question is one whose due date has not passed.>
- Click on the text of any question from the dashboard to:
  - See a larger view of the results, or
  - Vote (if you haven't yet and the question is still active).
        < NOTE: After voting, the page will refresh with results up to and including your vote, and 
        you won`t be able to return to the voting page again. 
        Questions with two answers will display as a bar chart, else pie chart. (All questions must have two answers.)>

###Known bug(s):
- Links to new questions don't work because there aren't any answers yet.
Display page for each question shows the top answer incorrectly. 
This was an extra feature we added, but one we'd like to see functioning.
- Need to create more tests and move some logic out of the views and into custom methods.
- Possibly make the Next Question button on question show go to a different location than All Questions button.

##Original Specs:

Option 3: Voting Booth

- ~~Make an application that lets users create yes or no questions and send a link to people to vote on them.~~
- ~~You don't need to add in emailing capabilities -- just give the user the link they need to send to friends.~~

- ~~You'll need users to create the questions, and probably want users in order to vote -- otherwise, 
the same person could vote over and over. Maybe you could figure out a way to prevent that with the session.~~

- ~~Each question has its own URL and if you've voted, you see the results. If you haven't, you can vote.~~

###Nice to have
- ~~Show a pie chart when you show results -- maybe Chartkick would help? http://chartkick.com/~~
- ~~Allow questions with multiple choice, not just yes or no~~
- ~~Have a page for each user where they can see all their questions~~
- ~~Put a time limit on questions. After the question's end date, no one can vote and everyone can see results.~~
- Let people add comments on questions they've answered (or have run out of time to vote)

###Things to learn
- ~~Creating users~~
- ~~Preventing multiple votes per user~~
- ~~How would you store a question that could have multiple answers?~~
