# Introduction

Logspout.

# Building

```
docker build -t tldr/prometheus .
```

# Running

```
docker run -d --name prometheus -h prometheus --dns 172.17.0.1 -p 9090:9090 tldr/prometheus
```

Test run, dumps the content of the rendered file to standard output:

```
docker run -it --rm --name prometheus -h prometheus --dns 172.17.0.1 -p 9090:9090 tldr/prometheus -dry
```