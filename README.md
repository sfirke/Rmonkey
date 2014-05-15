# A Survey Monkey R Client #

[![Build Status](https://travis-ci.org/leeper/Rmonkey.png?branch=master)](https://travis-ci.org/leeper/Rmonkey)

**Rmonkey** provides access to [Survey Monkey](https://www.surveymonkey.com/), for the complete integration of survey data collection and analysis into a single, easily reproducible workflow.

## Installation ##

**Rmonkey** is [available on GitHub](http://github.com/leeper/Rmonkey) and can (soon) be installed from within R from your favorite CRAN mirror:

```
install.packages("Rmonkey")
```

And the latest development version, available here, can be installed directly using  [devtools](http://cran.r-project.org/web/packages/devtools/index.html):

```
# install.packages("devtools")
library("devtools")
install_github("leeper/Rmonkey")
```

## Setup ##

To use Rmonkey, the user must have a Survey Monkey account, a Mashable Survey Monkey Developer account, and a registered API application. To create a Survey Monkey account, visit https://www.surveymonkey.com/user/sign-in/. To create a Mashable developer account, visit https://developer.surveymonkey.com/member/register. Once registered, it is relatively easy to obtain an API key and secret client ID. It is then also possible to register an API application. This requires a name, OAuth redirect URL, and a brief description. In order to use Rmonkey, the redirect url must be registered as `http://localhost:1410`.

Once everything is registered, the relevant variables can be loaded into R using `options`:

```
options(sm_api_key = 'YourAPIKey')
options(sm_secret = 'YourAPISecret')
options(sm_client_id = 'YourMashableDeveloperUsername')
```

Rmonkey uses these values inside `smlogin` to initiate an OAuth2.0 login. Calling `smlogin()`, you will redirected to your web browser, where you will login with your regular Survey Monkey account information. `sm_login` will then store a durable OAuth token in `options('sm_oauth_token')`, which is automatically retrieved in subsequent Rmonkey operations.

This token is currently long-lived (meaning it is valid indefinitely). This means that saving the OAuth token between R sessions will prevent you from having to login each time you load **Rmonkey** and allow you to use the package in non-interactive R sessions. If you have trouble logging in, it is also possible to generate an OAuth token using the [API Console](https://developer.surveymonkey.com/api_console), which can then be manually stored in `options('sm_oauth_token')`. 

## Code Examples ##

Coming soon.

### Creating a survey and retrieving results ###

Here's a basic workflow:

```
templates <- templatelist()
createsurvey(template[[1]], title = 'My New Survey', recipients = c('recipient1@example.com'),
             email_replyto = 'myemail@example.com', email_subject = 'Take my survey!')
# distribute manually via your web browser
s <- surveylist()
r <- respondentlist(s[[1]])
a <- getresponses(r, s[[1]])
as.data.frame(a)
```


### Polling for new responses ###

Based on: https://developer.surveymonkey.com/mashery/polling


### Literate Report Generation ###

 1. Create survey from template
 2. Pull responses in literate Rmd document and publish
