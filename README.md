# Kubernetes Operator Workshop

This repository contains the artifacts for the Kubernetes Operator Workshop.

## Overview

This is a three-day workshop for system administrators or developers interested in building operators with the [operator-sdk](https://github.com/operator-framework/operator-sdk).

## Workshop Outline

Workshop outline is available [here]https://docs.google.com/document/d/1hAUfQPUVD9oWikkBpABKicSQqCY552Gz30o9aPO05n0/edit).

## Workshop Exercises

Workshop exercises are available 24-7 [here](http://play.instruqt.com/openshift)

Workshop exercises source code resides [here](https://github.com/openshift-instruqt/instruqt).

## Workshop Slides

Google Slides are available [here](https://drive.google.com/drive/u/0/folders/1l6FY1QdBq1IsmwM6Ib44A8h12OSKGJbe)

## Host-Your-Own Exercises

The training content consists of Google Slides, linked above, Instruqt interactive learning labs, and lab exercises
that are written in [Markdown](https://daringfireball.net/projects/markdown/).

The lab exercise content is packaged up using [Jekyll](https://jekyllrb.com/), which
renders the Markdown as HTML and creates a static site that can be deployed onto
a web server.

The first step is to preview the content locally using the official Jekyll
container from the root of the project. This will build the site on the preview
server. The following command should make the preview site available at
http://0.0.0.0:4000/.

```bash
docker run --rm -it -p 4000:4000 -v `pwd`/content:/srv/jekyll jekyll/jekyll /bin/sh -c 'gem install bundler:1.16.0; jekyll serve'
```

The lab exercises are located in the `content/labs` directory. Any changes made
to the content should be updated while running the preview site in the Jekyll
container.

## Deployment

Once the content is ready to be deployed onto a web server perform the folllwing steps:

* Log into the exercise aws instance (Please ask a colleague for the private key):

  `ssh -i ~/.ssh/openshift ubuntu@workshop.coreostrain.me`

* Navigate to the exercise directory and pull your recently **tested** and **commited** exercise changes:

  `cd /home/ubuntu/operator-workshop` 
  
  `git pull`

* Build your content into static html:

```bash
sudo docker run --rm -it -v `pwd`/content:/srv/jekyll jekyll/jekyll /bin/sh -c 'gem install bundler:1.16.0; jekyll build'
```

* Verify the website reflects your changes at [http://workshop.coreostrain.me](http://workshop.coreostrain.me).
