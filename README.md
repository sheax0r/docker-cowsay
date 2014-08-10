# Docker Cowsay
Possibly the most useless docker image in existence!
Docker-cowsay runs an HTTP API that exposes cowsay operations.
Make cows say things, just like you always wanted to!

## Prerequisites
To build docker-cowsay from source, I recommend [fig](http://www.fig.sh), but you can get by just with docker.

### Building and running with fig
This method will automatically forward port 80 on your host machine to port 80 on the docker container.
```bash
fig build
fig up
```

### Building and running with docker
```bash
docker build -t cowsay --api .
docker run -p 0.0.0.0:80:80 -t cowsay
```

### Installing and running from the docker registry
```bash
docker pull sheax0r/docker-cowsay
docker run -p 0.0.0.0:80:80 sheax0r/docker-cowsay
```

### API Operations

List cows:
```bash
curl -O http://localhost
```

Make a cow say stuff:
```bash
curl -O http://localhost/somecow/stuff%20to%20say
```

### Extra stuff
You can also make your docker-cowsay container run cowsay directly, rather than launching an api, like so:
```bash
docker run -t cowsay i can haz cows?
```

Output:
```
 _________________
< i can haz cows? >
 -----------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```


## Contributing

Why would you feel the need to do that? But if you must:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
