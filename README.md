<p align="center">
 

  <h1 align="center"> Social Media App</h1>
  <p align="center">
  <img width="61" alt="rails" src="https://user-images.githubusercontent.com/5237154/85113533-0da2b800-b235-11ea-95ac-31b896096efe.png"> &emsp;
  <img width="61" alt="ajax" src="https://user-images.githubusercontent.com/5237154/85926619-2d358280-b8be-11ea-8782-8bcd23023cd3.png"> &emsp;
  <img width="61" alt="bootstrap" src="https://user-images.githubusercontent.com/5237154/85926622-2f97dc80-b8be-11ea-8fce-592b244198d0.png"> &emsp;
  </p>
</p>
<p align="center">
Its a social media app with these functionalities:  1. Friendship invite model and association with User model 2. bind the model and association with Controller and UI. 3. All Major functionalities for friendship request. 4. Model testing and Integration testing
</p>

## Live link(Heroku)

- https://jassi-kartick-social-media-app.herokuapp.com

### Prerequisites

Ruby: v2.7.0
Rails: v5.2.4
Postgres: >=9.5

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4

## Getting Started

To get a local copy up and running follow these simple example steps.

### Setup

```bash
git clone git@github.com:karthi07/ror-social-scaffold.git
cd ror-social-scaffold
bundle install
```

Setup database with:

```bash
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```bash
    rails server
```

Open `http://localhost:3000/` in your browser.

## How it works 

- Should able to see all the list of friends and can send friendship request to others, but not to self.

![Screenshot from 2020-05-26 14-06-07](https://user-images.githubusercontent.com/55361440/82879675-e5d47300-9f5a-11ea-9f3c-d6b2bb48de70.png)

- once request is send to a friend you will see request is pending so that you can't send the request to the same person again and again.

![Screenshot from 2020-05-26 14-06-44](https://user-images.githubusercontent.com/55361440/82879965-5bd8da00-9f5b-11ea-8fe6-6a1d3495031f.png)

- if a friend sends you a request you will have a option to accept or reject that requset.

![Screenshot from 2020-05-26 14-07-59](https://user-images.githubusercontent.com/55361440/82880426-08b35700-9f5c-11ea-8368-bc3190ed9303.png)

- after accepting a friend requset you will have a option to unfriend that friend.

![Screenshot from 2020-05-26 14-08-31](https://user-images.githubusercontent.com/55361440/82880615-4e701f80-9f5c-11ea-9f18-f158f3f6e709.png)

- in timeline you can only see the posts by your friends.

![Screenshot from 2020-05-26 14-09-09](https://user-images.githubusercontent.com/55361440/82880963-b3c41080-9f5c-11ea-8afa-18f14303e3a7.png)

### Run tests

```
    rpsec --format documentation
```



## Authors

👤 **Jaspreet Singh** 
    
- [LinkedIn](https://www.linkedin.com/in/jaspreet-singh-a28286146/)
- [GitHub](https://github.com/jaspreet-singh-sahota)
- [E-mail](jaspreetsinghjassi01@gmail.com)
- [Portfolio](https://jaspreet-singh-portfolio.netlify.app/)

👤 **Kartick** 
    
- [GitHub](https://github.com/karthi07)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/karthi07/ror-social-scaffold/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

microverse
The odin project

