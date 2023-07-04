![logo](./media/sh-banner.png)
=========
[![Maintenance](https://img.shields.io/maintenance/yes/2023.svg?style=flat-square)]()
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Needs Feedback](https://img.shields.io/github/issues/securehats/toolbox/needs%20feedback?color=blue&label=needs%20feedback%20&style=flat)](https://github.com/securehats/toolbox/issues?q=is%3Aopen+is%3Aissue+label%3A%22needs+feedback%22)

# Attacking Gandalf

![image](https://github.com/SecureHats/gandalf/assets/40334679/4168f1bf-fffe-44cf-9198-aba3f8224883)

So you are getting frustrated by Gandalf? I know that feeling, and that is why I am helping you out.  
Lakare has put great effort into creating the Gandalf AI game, and I really loved playing it.

Although it is a nice way to show how you can add a security layer to a ChapGPT or AI solution, we still do need to remember that we have to implement basic security by design.  
In this case I need to say that with the Gandalf game, too much effort is being put into protecting the front-end, but was neglected at the backend  

The increase of API attacks is immense and this project is giving an example of that, by executing a brute force attack against the Gandalf API using the yourock.txt password list.  
To limit the number of attempts required by analyzing the passwords in the Gandalf game, just requesting the password length, through the API.

## How to get started

- [] Clone this repo
- [] go to the repo folder
- [] run the script `invoke-gandalf -level 1`

```powershell
Invoke-Gandalf -level 1
```
## Not happy?

If you encounter any issues, or have suggestions for improvements, feel free to open an Issue

[Create Issue](../../issues/new/choose)
