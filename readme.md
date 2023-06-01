# Adlister Project

An application offers users a seamless experience, allowing them to register an account, log out, and efficiently modify their account details. Additionally, enabling users to effortlessly add, edit, or delete ads to their page.

## Languages
- Java
- Jsp
- Tomcat Server
- CSS
- Bootstrap
- Javascript
- MySql
## Authors

- [@NicholasHubacek03](https://github.com/NicholasHubacek03)
- [@Marie5646](https://github.com/Marie5646)
- [@MiguelG87](https://github.com/MiguelG87)


## How to Run
Clone the project
```bash 
git clone SSH git@github.com:autrey-hubacek-gutierrez-adlister/a-n-m-adlister.git
```
Make sure to have a mySQL server running with terminal command
```bash
mySQL.server start
```
Create a Config.java in the following directory.
```bash
touch {project directory}/src/main/java/com.codeup.package.adlister/dao/Config.java
```
Populate Config.java with the following content where username and password are your mySQL credentials.
```bash
package com.codeup.adlister.dao;

class Config {
    public String getUrl() {
        return "jdbc:mysql://localhost:3306/adlister_db?allowPublicKeyRetrieval=true&useSSL=false";
    }
    public String getUser() {
        return "root";
    }
    public String getPassword() {
        return "codeup";
    }
}
```

Ensure lastest TomCat 9.0.74 server is ready to deploy on local host. Install all Maven dependencies.

Run the following file: Migration.sql


Launch Tomcat and a browser tab prompting login will appear.

Enjoy!
