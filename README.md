# README

# GearX

## Description

Heroku Link: https://gear-x.herokuapp.com/

GearX provides a platform to match borrowers and lenders or outdoor equipment. Users can post items they are willing to lend or are searching for. And other users can then select these and the two will be matched up to set up a transaction. Each user can also create a profile about their trips and opinions on gear that they have borrowed.

## Authors
* Kate Brown (https://github.com/kb8158)

## Features

* Creating and signing into a user account
* Adding gear and gear searched for
* Linking up borrowers and lenders
* All gear in the inventory is listed but if an item is not available it is listed under the checked out section
* Owners of items can mark it as available or not, all borrowers are stored for the history of the item
* Adding reviews for a borrowed item
* Emailing a user once their post has been selected

## Technologies

* Ruby on Rails
* ReactJS
* PostgreSQL
* CarrierWave
* Devise
* Sendgrid

## Local Setup

```
git clone https://github.com/kb8158/GearX.git
cd GearX
bundle install
npm install
rake db:create && rake db:migrate
```
## To-Do List

* Create item history, store multiple borrowers and Owners will be able to mark an item as available or not. Move item reviews to be part of the details when it is available.
* API integration
* Expanding CarrierWave to allow users to upload item photos
* Make email and transaction set up more personalized
* Add location range to search functionality

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kb8158/GearX. Use the [fork-and-branch](http://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/) workflow to contribute.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
