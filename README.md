# Haproxy Dockerfile

This repository contains Dockerfile of Haproxy with consul-template and statsd stats module

[![](https://badge.imagelayers.io/jmaitrehenry/haproxy:latest.svg)](https://imagelayers.io/?images=jmaitrehenry/haproxy:latest 'Get your own badge on imagelayers.io')

## Base Docker Image

[haproxy:1.5](https://registry.hub.docker.com/_/haproxy/)

## Installation

1. Install [Docker](https://www.docker.com/)
2. Have a consul server running
3. Download image from public [Docker Hub Registry](https://registry.hub.docker.com/repos/jmaitrehenry/) 
    `docker pull jmaitrehenry/haproxy`

## Usage

```
docker run \
    -d -p 80:80 \
    -e CONSUL_SERVER=X.X.X.X:8500 \
    -e CONSUL_SERVICE_NAME=service-name-80 \
    -e STATSD_HOST=X.X.X.X \
    -e STATSD_PORT=8125 \
    -e STATSD_NAMESPACE=haproxy \
    jmaitrehenry/haproxy
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## TODO

- Adding statsd module
- Add support for more than one service (like HTTP and HTTPs for one service in the same instance)

## Credits

- [Julien Maitrehenry](https://github.com/jmaitrehenry)

## License

The MIT License

Copyright (c) 2015 Julien Maitrehenry http://www.jmaitrehenry.ca

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
