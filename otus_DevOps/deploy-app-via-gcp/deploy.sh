#!/bin/bash
git clone https://github.com/Otus-DevOps-2017-11/reddit.gitruby
cd reddit && bundle install
puma -d