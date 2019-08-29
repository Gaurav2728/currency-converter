
[![Build Status](https://travis-ci.org/Gaurav2728/currency-converter.svg?branch=master)](https://travis-ci.org/Gaurav2728/currency-converter)

> https://gist.github.com/badmanski/96ec542b0e07173562118fe3981e0f54
# Goal

The goal is to build a web app that allows users to store and analyze historical data for currency exchange rates.

# Description (as an example)

- Person can create an account by signing up with Google OAuth API
- Signed in person creates a favourite exchange rate for a currency pair
- An exchange rate pair is represented by:
  - amount in base currency (i.e. `10 000`)
  - base currency (i.e. `USD`)
  - target currency (i.e. `EUR`)
  - historical duration in weeks (i.e. `25`)
- System fetches currency rates for last `25 weeks`
- System generates a historical table and a graph using the retreived information
- From the table, user can see for every week:
  - year and week number from calendar
  - rate from API for a week
  - the the valuation of amount in base currency for the period of time
  - profit/loss in comparison with today's rate
  - highest and lowest historical values highlighted
- From the graph, user can see visual representation of highest and lowest rates
- User can create/edit/delete multiple calculations, all of those will be stored in database

# API

API to be used for currency rates: http://fixer.io/

Do you best to focus on performance and avoid unnecessary requests to the API.

# Technical Requirements

- Use latest Ruby and Rails versions
- Bootstrap 4
- Authentication with Google OAuth API
- Decent coverage with unit tests (use your best judgement for coverage)
- Code style passes rubocop checks
- Code available in GitHub
- App deployed to Heroku
- Make currency exchange rates client easily extendable with other providers and APIs
- Use the best suitable database for given task

# Bonus points

- Show your OOP-design / software testing skills
- Make suggestions for improving any part of this homework
- Optimal performance in terms of API calls

# Supported currencies

```
AUD, BGN, BRL, CAD, CHF, CNY, CZK, DKK, EUR, GBP, HKD, HRK, HUF, IDR, ILS, INR,
JPY, KRW, MXN, MYR, NOK, NZD, PHP, PLN, RON, RUB, SEK, SGD, THB, TRY, USD, ZAR
```
