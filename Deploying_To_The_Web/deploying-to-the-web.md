# Deploying a Web Site

### Luke DeWitt - DTC Ruby Meetup - 2/4/2015 - Ruby Beginners Talk

#### E-Mail - luke@dewittsoft.com / Twitter - lanewalkerx

---

# Overview of the steps in this talk

- Installing Rails
- Getting Rails up and running

---

# Installing Rails

```$ gem install rails -v 4.2.0```

- The -v flag ensures that it is rails version 4.2.0

- Note: This can take a while.

---

## First step "hello, DTC Ruby Group."

- First create this on my local machine.

- In a folder called workspace create a new rails application.

```
$ mkdir workspace     # Make a workspace directory.
$ cd workspace/       # Change into the workspace directory.
$ rails _4.2.0_ new hello_app
```

---

## First step "hello, DTC Ruby Group."

- The ```rails new``` command runs the bundle install command

- This command creates a new folder called ```hello_app```

- Then fills the new folder with all the boilplate code for a rails application

---

## First step "hello, DTC Ruby Group."

```
Lukes-MacBook-Pro:workspace luke$ cd hello_app/
Lukes-MacBook-Pro:hello_app luke$ ls
Gemfile   Rakefile  config    lib   test
Gemfile.lock  app   config.ru log   tmp
README.rdoc bin   db    public    vendor
```

---

## First step "hello, DTC Ruby Group."

There is now enough code to spin up a rails server.  All you have to do is invoke the following unix incantation.

```$ rails server```

Point your favorite browser to the following address.

### http://localhost:3000/

---

### First step "hello, DTC Ruby Group."

- The default home page is shown here.

- Notice this comes with links to rails online documentation.

- It also gives some hints on how to get started.

![right fill](rails-default-screen.png)

---

## First step "hello, DTC Ruby Group."

- Our first change will be to change the home page to say hello.

- Change to the controllers file under the apps file

```
$ cd app/controllers/
$ pwd
.../workspace/hello_app/app/controllers
$ ls
application_controller.rb concerns
```

---

## First step "hello, DTC Ruby Group."

- To do this have to change a couple of things.

- First is in the applicationcontroller.rb

```$ vi applicationcontroller.rb```

![inline 85%](default-applicationcontroller.png)

---

## First step "hello, DTC Ruby Group."

- Add the following to the file.

![inline 85%](modified-applicationcontroller.png)

- This does not work quite yet need one more change.

---

## First step "hello, DTC Ruby Group."

- Have to tell the application where the root action is.

- Must change the root in the routes.rb file under the config folder.

```
$ cd config
$ ls
application.rb  database.yml  environments  locales   secrets.yml
boot.rb   environment.rb  initializers  routes.rb
$ pwd
.../workspace/hello_app/config
```

- Open up the routes.rb file

---

## First step "hello, DTC Ruby Group."

```$ vi routes.rb```

![inline 85%](default-route.png)

- Change the above to what is below

![inline 85%](modified-route.png)

---

## First step "hello, DTC Ruby Group."

- This tells ruby to run the hello function in the application controller.

- Shut down your rails server if it is still running (Ctrl-c), and restart it.

### http://localhost:3000/

![right 80%](hello-page.png)
