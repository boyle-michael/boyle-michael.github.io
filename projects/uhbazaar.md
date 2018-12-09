---
layout: project
type: project
image: images/uhb-logo.png
title: UHBazaar
permalink: projects/uhbazaar
# All dates must be YYYY-MM-DD format!
date: 2015-12-09
labels:
  - Meteor
  - Semantic UI React
  - IntelliJ IDEA
  - Terminal
summary: Collaborating with three other students, we created a web app called, UHBazaar. UHBazaar was designed to be a localized marketplace for the UHM community. 
projecturl: https://uhbazaar.github.io
---

# Table of Contents

* [About UH Bazaar](#about-uh-bazaar)
* [User Guide](#user-guide)
* [Community Feedback](#community-feedback)
* [Development History](#development-history)
  * [Preview our Progress](#preview-our-progress)
  * [Milestone 1](#milestone-1-mockup-development)
  * [Milestone 2](#milestone-2-functional-implementation)
  * [Milestone 3](#milestone-3-beyond-the-basics)
* [Developer Guide](#developer-guide)
  * [Installation](#installation)
  * [Github Workflow](#github-workflow)
* [About Our Team](#about-our-team)

# About [UH Bazaar](http://uhbazaar.meteorapp.com/#/)


UH Bazaar is a Meteor application that aims to provide a localized marketplace for the University of Hawaii at Manoa
community, which accomadates buying, selling and trading goods.  UH Bazaar aims to provide a comfortable experience for
students by keeping the exchanges on campus and between students.  With the tides of incoming and outgoing students,
whether graduating or just returning home for the summer, there is a wealth of commodity in need of a custom tailored
facilitation to manage exchange.  To help facilitate secure exchange, UH Bazaar intends to implement the UH CAS login system
to enforce student-student interaction, as well as a goods map for convenient navigation on campus.

### UH Bazaar looks to make being a student just a little less stressful.

This landing page is to be implemented as a type of 'flyer' for informing users about what exactly our application is, as
well as containing informaition on functionality and a projected date for a beta release.  Meteor Galaxy will be the means
through which the application will be hosted, the hope is to have the application hosted as soon as possible.  Updates are to
follow.

# User Guide

### [Landing Page](http://uhbazaar.meteorapp.com/#/)
#### The landing page when there is no user

<img src="images/landing-page-without-user.png"/>

From here the user can can log in, or choose to become a member.


##### The landing page greets the user, with a brief overview of what the application intends to accomplish.

<img src="images/landing-page-with-user.png"/>

<img src="images/user-landing-page.png"/>



### User Profile
##### The profile of a user's own account gives additional options, including 'edit profile' and 'remove' your items.

<img src="images/user-profile-page.png"/>
<img src="images/user-profile-page-bottom.png"/>


If a user visits their account page and they don't have any items, a button appears, linking to the create an item page!

### Edit Profile
##### This page allows simple edits to be made to a user's profile.

<img src="images/edit-profile-update.png"/>

When editing, the current data is displayed to the user in the text boxes.

### View Users
##### The view other users page displays a list of all the users in the system.

<img src="images/view-users-page.png"/>

From here, users can browse other profiles and see what people are trying to get rid of!

### New Item Page
##### This page allows users to post their items!

<img src="images/newItem.png"/>

The new item page allows a user to create a listing for an item / service.

### Categories Page
##### The categories page displays links to items grouped by categories!

<img src="images/updated-categories-page.png"/>

A simple way to look at what users have to offer.

### Category Page
##### This page lists all the items by category.

<img src="images/updated-category-page.png"/>

Here, the user can sort the items by title, date or price.  A convenient sidebar allows for fast and
efficient transitioning through categories!

### Search Feature
##### Users can simply look up items by keyword!

<img src="images/search-bar-image.png"/>

A fast and efficient way to see if an item is available through UH Bazaar.

### Admin Page
##### An admin can administer!

<img src="images/admin-page.png"/>

An admin has access to editing and deleting all database documents on the application

# Community Feedback

Uh Bazaar was tested by a handful of students from UH Manoa, here's what they had to say...

**Shawn M.**

> Easy to Follow the onscreen prompts, nice site design. Categories page makes it easy to look for items.  Maybe create a confirmation  page after completing the creation of account.  A page with featured items would be appealing.  Expand the homepage; more explanation to potential customers.

**Ramsey A.**

>The website is easy to navigate, the transitions between pages are smooth, easy to read font and size.  No popping or distracting colors, plain and simple.  Maybe make the menu bar a bit more noticeable, greet the customer after login screen.

**Ilm M.** 

> The webpage is smooth all over, it's easy to access the tabs.  Nice background! Maybe make the menu bar bigger and eye popping to get attention, more colors.

**Aaron B. had this to say:**

> UH Bazaar was user-friendly and quick to learn. Everything is straightforward making navigation and posting easy. I can't wait to see it functioning with more members. Truly an ingenious idea, combining the college student lifestyle with practicality to streamline a campus need.

# Development History

Development for this project aims to adhere to the structure of [Issue Driven Project Management](http://courses.ics.hawaii.edu/ics314f16/modules/project-management/) practices.  This is basically a sequence of milestones
consisting of a practical set of issues to tackle in a given time frame.  The following documents the history of UH Bazaar's
milestones.

## Preview our Progress

* [Deployed Progress](http://uhbazaar.meteorapp.com/#/)
* [Milestone 1 Project Page](https://github.com/uhbazaar/uhbazaar/projects/2)
* [Milestone 2 Project Page](https://github.com/uhbazaar/uhbazaar/projects/3)
* [Milestone 3 Project Page](https://github.com/uhbazaar/uhbazaar/projects/4)

## [Milestone 1](https://github.com/uhbazaar/uhbazaar/projects/2#card-14557943): Mockup Development

This milestone began on November 6th, 2018 and was completed on Novemeber 14th, 2018.

The main goal in milestone 1 is to complete mockups for a series of pages in UH Bazaar.  Development was done using Semantic
UI React within a Meteor application.  The intial goal was to create mockups of a base set of application pages that would 
allow for functional site in minimal time. This included

- Landing page
- User Home Page
- Admin Home Page
- User profile / edit profile page
- Category / Categories page
- List item page
- Create item page
- Notify admin page

## [Milestone 2](https://github.com/uhbazaar/uhbazaar/projects/3): Functional Implementation

Milestone 2 realized most of the basic functionaloty expected out of UH Bazaar.  The application became a
minimum viable product for user testing.

Milestone 2 began on Novemeber 15, 2018 and was completed on November 28, 2018.

## [Milestone 3](https://github.com/uhbazaar/uhbazaar/projects/4): Beyond the Basics

This milestone aims to go beyond basic functionality, incorporating more refined characteristics in terms of
privacy and usability, as well as implementing additional features.

Milestone 3 began on November 29, 2018 and was completed on December 6, 2018.

# Developer Guide
### Want to join forces? Here's how!

#### Installation
First, [install meteor](https://www.meteor.com/install)

Second, [Fork us on github!](https://github.com/uhbazaar/uhbazaar) and clone the repo to your favorite laptop.

Once in the main directory simply...

```asp
cd app
```
After which you will need to install the required node libraries...
```asp
meteor npm intall
```
...as well as the following for the confirm box module... 
```
npm install react-confirm-alert --save
```
The first time starting the app intializes some default data.  The output should look something like this...
```asp
meteor npm run start

> meteor-application-template-react@ start /Users/admin/github/uhbazaar/uhbazaar/app
> meteor --no-release-check --settings ../config/settings.development.json

[[[[[ ~/github/uhbazaar/uhbazaar/app ]]]]]    

=> Started proxy.                             
=> Started MongoDB.          
I20181123-20:41:23.009(-10)? Creating the default user(s)
I20181123-20:41:23.026(-10)?   Creating user admin@foo.com.
I20181123-20:41:23.027(-10)?   Creating user john@foo.com.
I20181123-20:41:23.027(-10)? Creating default data.
I20181123-20:41:23.027(-10)?   Adding: Basket (john@foo.com)
I20181123-20:41:23.027(-10)?   Adding: Bicycle (john@foo.com)
I20181123-20:41:23.027(-10)?   Adding: Banana (admin@foo.com)
I20181123-20:41:23.027(-10)?   Adding: Boogie Board (admin@foo.com)
I20181123-20:41:23.027(-10)? Creating default users.
I20181123-20:41:23.027(-10)?   Adding: G (john@foo.com)
I20181123-20:41:23.027(-10)?   Adding: Waters (admin@foo.com)
I20181123-20:41:23.027(-10)? Creating default Categories.
I20181123-20:41:23.027(-10)?   Adding: Books (book)
I20181123-20:41:23.028(-10)?   Adding: Furniture (bed)
I20181123-20:41:23.028(-10)?   Adding: Vehicles (truck)
I20181123-20:41:23.028(-10)?   Adding: Personals (heart)
I20181123-20:41:23.028(-10)?   Adding: Free (circle)
I20181123-20:41:23.028(-10)?   Adding: Housing (home)
I20181123-20:41:23.028(-10)?   Adding: Pets (sticker mule)
...
(other data)
...
=> Started your app.
```

**Tips regarding Bcrypt warning.**
The following message will display when you run this app...
```asp
Note: you are using a pure-JavaScript implementation of bcrypt.
While this implementation will work correctly, it is known to be
approximately three times slower than the native implementation.
In order to use the native implementation instead, run

  meteor npm install --save bcrypt

in the root directory of your application.
```
Installing bcrypt can lead to some real headaches if your using a Windows machine.  If your running macOS or Linux, your 
windows friends will stop talking to you. Bcrypt doesn't tell you this, but I will. Bcrypt is only used in Meteor for password 
checking, meaning performance impacts are not at all noticeable with a small user-base.

**That's it!**
You are now ready to start contributing to UH Bazaar!

## Github Workflow
#### A useful walkthrough for getting familiar with how to contirbute using pull requests!

### Phase 1
#### Set up
- Fork the "Main" repository (i.e. UHBazaar) to your personal Github account
  *You can do this by going to your organization's GitHub repository and clicking on fork (top right corner)*
- Clone that repo to a local directory.
- Open your command-line and cd into the local repo.
- Now add your organizations main repo as a remote called "upstream."
```bash
git remote add upstream "url of your organizations main repo"
```
- Now set the remote url as origin to your forked version of upstream.
```bash
git remote set-url origin "url of your forked repo"
```
- Type this
```bash
git remote -v
```
- You should see something like this
```bash
origin	https://github.com/zakgilbert/uhbazaar.github.io.git (fetch)
origin	https://github.com/zakgilbert/uhbazaar.github.io.git (push)
upstream	https://github.com/uhbazaar/uhbazaar.github.io.git (fetch)
upstream	https://github.com/uhbazaar/uhbazaar.github.io.git (push)
```
- Notice the main repo is named upstream and your personal forked repo is named origin.

### Phase  2
#### Editing Code and Creating a pull request
-First create an issue in your organizations github project repo.
<img src="images/issueCreated.png"/>
- Open your command line and cd into your personal forked directory.
- Now we have to pull from the upstream master branch and push it to your personal origin master branch.  Otherwise you won't be working with the most current version of upstream master. This must be done evey time before making a new branch. Also you should only enter these next two commands when in your local master branch.
```bash
git checkout master     //switch to master branch
git pull --rebase upstream master
git push -f origin master
```
- Now create a branch make sure you remembered the number your issue was givin when you created it.
```bash
git branch pull-request-Issue-"insert issue number"
```
- Now switch to that branch
```bash
git checkout pull-request-Issue-"insert issue number"
```

### Phase 3
#### Commiting and creating a pull request
- Once you are satisfyed with your work on the branch you've created. Within that current branch add and commit your changes, then push like this.
```bash
git push origin "branch name"
```
- Now access your organizations main repo and create a pull request.
<img src="images/pullRequest1.png"/>

- Create new pull request.
- Click on the compare across forks option.
- Your base fork should be the main project repo and the head fork should be your personal fork.
<img src="images/pullRequest2.png"/>
- Create the pull request so your team mates can review it, before they pull it to the main repo.

#### The color scheme used for UHBazaar is [Serio Verify](https://www.awwwards.com/sites/serio-verify)

- ![#17252a](https://placehold.it/15/17252a/000000?text=+) `#17252a`
- ![#2b7a78](https://placehold.it/15/2b7a78/000000?text=+) `#2b7a78`
- ![#3aafa9](https://placehold.it/15/3aafa9/000000?text=+) `#3aafa9`
- ![#def2f1](https://placehold.it/15/def2f1/000000?text=+) `#def2f1`
- ![#feffff](https://placehold.it/15/feffff/000000?text=+) `#feffff`


# About Our Team

### Wyatt Hoodes

Wyatt Hoodes is a computer science major pursuing his bachelor of science degree.  Hoodes enjoys
a clever hack in C and is currently expanding into C++, with eyes on the rich reservoir of
python libraries as well.  He is comfortable with the Java API, but doesn't like how Java
has occasionaly lied (think 'pass by reference').  Hoodes has recently garnered a fascination with
functional programming, and the elegance a functional approach provides in tackling problems.
In regards to UH Bazaar, his thoughts are:

> I'm excited to hone my software engineering skills, while gaining valuable experience
> regarding team dynamics in software design and implementation.  An added bonus is doing
> this all in conjunction with open-source development paradigms.

### Zachary Gilbert
Zak Gilbert is currently seeking a bachelors in computer science from the University of Hawaii at Manoa. Gilbert has an intermediate background in the Java and C programming languages, and enjoys surfing and solving interview problems in his free time.

> For the UH Bazaar web app I plan to develop it as a formidable piece of software so that I may include it in my resume with confidence, at the same time I plan to hone my grasp on web development and team management.
>

### Leah-Mei Villanueva
Leah-Mei Villanueva is a computer science major pursuing her bachelor of science degree. Villanueva has experience in Java and Javascript. Recently, she has obtained an interest in software engineering, in which she seeks to expand her knowledge and skills.
> I am determined to expand my knowledge and use what I have learned to gain the confidence I need to be able to be more creative and exceed my own expectations. This experience of working in a team, not only pushes me to become less introverted, but also gives me an oppurtunity to progress in team management, cooperation, and social skills.

### Michael Boyle
Michael Boyle is a computer science major pursuing his bachelor of science degree. Boyle has experience in Java, iOS Development, and Javascript along with other web development tools. He has published a simple game to the iOS App Store and has completed two internships with Underwriters Laboratories. Recently, Boyle has taken interest in ethical hacking and artificial intelligence and hopes to expand his knowledge in the near future. In regards to UH Bazaar, his thoughts are:
> I’m eager to put what I have learned to the test and create something worthwhile. The learning process is rigorous and finally being able to push your limits and use some creativity is very welcomed. Most importantly, however, I will get my first true experience working in a productive team setting.
