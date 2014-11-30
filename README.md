# Docker Cowsay
Runs [http://github.com/sheax0r/cowsapi] in a Docker container.

## Prerequisites
To build docker-cowsay from source, I recommend [fig](http://www.fig.sh), but you can get by just with docker.

### Building and running with fig
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
## Contributing

Why would you feel the need to do that? But if you must:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
